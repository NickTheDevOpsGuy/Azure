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

echo "🔍 Checking jq..."
command -v jq > /dev/null || { echo "❌ jq is not installed. Please install jq."; exit 1; }

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
az deployment group create \
  --name "$DEPLOYMENT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --template-file bicep/main.bicep \
  --parameters environment=$ENV location=$LOCATION \
  --output json > deploy-output.json

echo "📦 Extracting values from deployment output..."
WEBAPP_NAME=$(jq -r '.properties.outputs.webAppName.value' deploy-output.json)
APPINSIGHTS_CONNECTION_STRING=$(jq -r '.properties.outputs.appInsightsConnectionString.value' deploy-output.json)

if [ -z "$WEBAPP_NAME" ] || [ "$WEBAPP_NAME" == "null" ]; then
  echo "❌ Web App Name not found in deployment output."
  exit 1
fi

if [ -z "$APPINSIGHTS_CONNECTION_STRING" ] || [ "$APPINSIGHTS_CONNECTION_STRING" == "null" ]; then
  echo "❌ Application Insights connection string not found in deployment output."
  exit 1
fi

echo "✅ Web App: $WEBAPP_NAME"
echo "✅ Connection String retrieved."

echo "📝 Creating .env file in $DEPLOY_FOLDER..."
echo "APPLICATIONINSIGHTS_CONNECTION_STRING=$APPINSIGHTS_CONNECTION_STRING" > "$DEPLOY_FOLDER/.env"

echo "🧹 Cleaning old zip..."
rm -f "$ZIP_FILE"

echo "📦 Installing production dependencies..."
pushd "$DEPLOY_FOLDER" > /dev/null
npm install --omit=dev --silent
popd > /dev/null

echo "📦 Creating deployment package (with node_modules)..."
pushd "$DEPLOY_FOLDER" > /dev/null
zip -r "../$ZIP_FILE" index.js package.json .env public views node_modules > /dev/null
popd > /dev/null

echo "🧩 Setting Node.js runtime to NODE|20-lts..."
az webapp config set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEBAPP_NAME" \
  --linux-fx-version "NODE|20-lts" \
  --output none

echo "🛠️ Setting startup command to launch Node app..."
az webapp config set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEBAPP_NAME" \
  --startup-file "node index.js" \
  --output none

echo "🔐 Setting environment variable in App Service..."
az webapp config appsettings set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEBAPP_NAME" \
  --settings APPLICATIONINSIGHTS_CONNECTION_STRING="$APPINSIGHTS_CONNECTION_STRING" \
  --output none

echo "🚀 Deploying zip to Azure Web App..."
az webapp deploy \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEBAPP_NAME" \
  --src-path "$ZIP_FILE" \
  --type zip \
  --output none

echo "✅ App deployed!"
echo "🔗 Visit: https://${WEBAPP_NAME}.azurewebsites.net"