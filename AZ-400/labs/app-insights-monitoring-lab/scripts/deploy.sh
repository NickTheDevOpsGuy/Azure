#!/bin/bash

# 🚀 AZ-400 Lab Deployer: App Insights + Optional Web App (Oryx-Ready)
set -e

# 💡 Usage: ./deploy.sh <environment> <deploy_web_app:true|false> <resource_group> <location>
if [ $# -lt 4 ]; then
  echo "❌ Missing arguments."
  echo "📘 Usage: ./deploy.sh <environment> <deploy_web_app:true|false> <resource_group> <location>"
  echo "🔁 Example: ./deploy.sh dev true NickClarkRG eastus"
  exit 1
fi

ENVIRONMENT="$1"
DEPLOY_WEB_APP="$2"
RESOURCE_GROUP="$3"
LOCATION="$4"

TEMPLATE="bicep/main.bicep"
DEPLOY_NAME="ai-monitoring-${ENVIRONMENT}-deploy"
APP_INSIGHTS_NAME="appinsights-${ENVIRONMENT}-nick"
LOG_ANALYTICS_NAME="log-${ENVIRONMENT}-nick"
WEB_APP_NAME="insightswebapp-${ENVIRONMENT}-nick"

echo "📦 Deploying to environment: $ENVIRONMENT"
echo "🌐 Web App deploy enabled: $DEPLOY_WEB_APP"
echo "🗂️ Resource Group: $RESOURCE_GROUP"
echo "📍 Location: $LOCATION"

# 🔧 Ensure Resource Group exists
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

# 🔨 Deploy Bicep template
echo "🚀 Running Bicep deployment: $DEPLOY_NAME"
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$DEPLOY_NAME" \
  --template-file "$TEMPLATE" \
  --parameters \
    environment="$ENVIRONMENT" \
    deployWebApp="$DEPLOY_WEB_APP" \
    location="$LOCATION" \
    appInsightsName="$APP_INSIGHTS_NAME" \
    logAnalyticsName="$LOG_ANALYTICS_NAME" \
    webAppName="$WEB_APP_NAME" \
  --verbose || { echo "❌ Deployment failed. Check Bicep template."; exit 1; }

# 🔍 Extract App Insights outputs
echo "📥 Extracting output values..."

CONN_STRING=$(az deployment group show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$DEPLOY_NAME" \
  --query "properties.outputs.appInsightsConnectionString.value" -o tsv)

INSTRUMENTATION_KEY=$(az deployment group show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$DEPLOY_NAME" \
  --query "properties.outputs.appInsightsInstrumentationKey.value" -o tsv)

# 🧪 Write .env file
echo "🔑 Writing App Insights connection info to .env..."
cat <<EOF > .env
APPINSIGHTS_INSTRUMENTATIONKEY=${INSTRUMENTATION_KEY}
APPLICATIONINSIGHTS_CONNECTION_STRING=${CONN_STRING}
EOF

# 🔄 Deploy FastAPI app using Oryx (only if requested)
if [[ "$DEPLOY_WEB_APP" == "true" ]]; then
  echo "🚀 Deploying FastAPI app using Oryx (az webapp up)..."
  az webapp up \
    --name "$WEB_APP_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --location "$LOCATION" \
    --runtime "PYTHON:3.11" \
    --quiet

  echo "🌐 FastAPI Web App is LIVE at:"
  echo "👉 https://${WEB_APP_NAME}.azurewebsites.net/docs"
fi

echo ""
echo "✅ Deployment complete."
echo "📊 App Insights Logs:"
echo "👉 https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/microsoft.insights%2Fcomponents"