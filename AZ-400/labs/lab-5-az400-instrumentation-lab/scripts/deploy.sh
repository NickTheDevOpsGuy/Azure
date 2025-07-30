#!/bin/bash
set -euo pipefail

RESOURCE_GROUP="NickClarkRG"
LOCATION="westus"
DEPLOYMENT_NAME="lab5-full-deploy"
ENV="dev"
DEPLOY_FOLDER="app"
ZIP_FILE="webapp.zip"

echo "🌐 Starting setup for environment: $ENV"

echo "🔍 Checking Azure CLI..."
az --version > /dev/null || { echo "❌ Azure CLI not found. Install it first."; exit 1; }

echo "📁 Creating resource group if it doesn't exist..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION" > /dev/null

echo "🧪 Validating Bicep deployment..."
az deployment group validate \
  --name "$DEPLOYMENT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --template-file bicep/main.bicep \
  --parameters environment=$ENV location=$LOCATION \
  --only-show-errors

echo "🚀 Deploying Bicep templates..."
if ! az deployment group create \
  --name "$DEPLOYMENT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --template-file bicep/main.bicep \
  --parameters environment=$ENV location=$LOCATION \
  --output json > deploy-output.json; then
  echo "❌ Deployment failed. Check the output above for details."
  exit 1
fi

if [ ! -s deploy-output.json ]; then
  echo "❌ Deployment output file not found or is empty."
  exit 1
fi

WEBAPP_NAME=$(jq -r '.properties.outputs.webAppName.value' deploy-output.json 2>/dev/null || echo "")
if [ -z "$WEBAPP_NAME" ]; then
  echo "❌ Web App Name not found in deployment output."
  cat deploy-output.json
  exit 1
fi

echo "✅ Infrastructure deployed. Web App Name: $WEBAPP_NAME"

echo "🛠 Building and zipping web app code..."
if [ ! -d "$DEPLOY_FOLDER" ]; then
  echo "❌ Deployment folder '$DEPLOY_FOLDER' not found!"
  exit 1
fi

pushd "$DEPLOY_FOLDER" > /dev/null

if [ -f "package.json" ]; then
  echo "📦 Installing npm dependencies..."
  npm install
  if grep -q '"build"' package.json; then
    echo "🔨 Running npm build..."
    npm run build
  fi
fi

zip -r ../"$ZIP_FILE" . > /dev/null
popd > /dev/null
echo "✅ Web app zipped into $ZIP_FILE"

echo "📦 Deploying zip to Azure Web App..."
az webapp deployment source config-zip \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEBAPP_NAME" \
  --src "$ZIP_FILE"

echo "✅ App deployed! View it at: https://${WEBAPP_NAME}.azurewebsites.net"