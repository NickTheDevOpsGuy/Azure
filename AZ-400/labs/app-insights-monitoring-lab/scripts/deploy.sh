#!/bin/bash

# 🚀 AZ-400 App Deployer with Oryx
set -euo pipefail

ENVIRONMENT="${1:-}"
DEPLOY_WEB_APP="${2:-}"
RESOURCE_GROUP="${3:-}"
LOCATION="${4:-}"

# 🛑 Validate inputs
if [[ -z "$ENVIRONMENT" || -z "$DEPLOY_WEB_APP" || -z "$RESOURCE_GROUP" || -z "$LOCATION" ]]; then
  echo "❌ Missing arguments."
  echo "Usage: ./deploy.sh <environment> <web_app_name> <resource_group> <location>"
  exit 1
fi

# 📦 Ensure you’re in project root and app/ folder exists
if [[ ! -d "./app" ]]; then
  echo "❌ Missing ./app directory. Please make sure your FastAPI project is in ./app"
  exit 1
fi

echo "🔧 Setting subscription (if needed)..."
az account show > /dev/null || az login

echo "🧱 Creating resource group if it doesn’t exist..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --output none

# 💡 Web App names must be globally unique
echo "🔍 Checking if app name '$DEPLOY_WEB_APP' is already taken..."
EXISTING_APP=$(az webapp list --query "[?name=='$DEPLOY_WEB_APP'] | [0].name" -o tsv)

if [[ -n "$EXISTING_APP" && "$EXISTING_APP" != "$DEPLOY_WEB_APP" ]]; then
  echo "❌ App name '$DEPLOY_WEB_APP' is already taken globally. Choose a new unique name."
  exit 1
fi

echo "📁 Changing into app directory..."
pushd ./app > /dev/null

echo "🚀 Deploying using Oryx (az webapp up)..."
az webapp up \
  --name "$DEPLOY_WEB_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --runtime "PYTHON:3.10" \
  --os-type Linux \
  --output none

popd > /dev/null

echo "⌛ Waiting for app to respond..."
APP_URL="https://${DEPLOY_WEB_APP}.azurewebsites.net"
for i in {1..10}; do
  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
  echo "⏳ Attempt $i: HTTP $STATUS_CODE"
  if [[ "$STATUS_CODE" == "200" ]]; then
    echo "✅ App is live at: $APP_URL"
    exit 0
  fi
  sleep 10
done

echo "🔔 Deploying alert rules for App Insights resource: ${DEPLOY_WEB_APP}-appi"

az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file "./alerts/alerts.bicep" \
  --parameters environment="$ENVIRONMENT" \
               location="$LOCATION" \
               appInsightsName="${DEPLOY_WEB_APP}-appi" \
               actionGroupEmail="nicholas.a.clark@outlook.com"

echo "❌ App failed to respond after deployment."
exit 1