#!/bin/bash

# 🚀 AZ-400 Lab Deployer: App Insights + Optional Web App
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
WEB_APP_NAME="insightswebapp-${ENVIRONMENT}-nick"

echo "📦 Deploying to environment: $ENVIRONMENT"
echo "🌐 Web App deploy enabled: $DEPLOY_WEB_APP"
echo "🗂️ Resource Group: $RESOURCE_GROUP"
echo "📍 Location: $LOCATION"

# 🔨 Deploy Bicep template
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$DEPLOY_NAME" \
  --template-file "$TEMPLATE" \
  --parameters environment="$ENVIRONMENT" deployWebApp="$DEPLOY_WEB_APP" location="$LOCATION"

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
echo "🔑 Writing App Insights connection info to app/.env..."
cat <<EOF > app/.env
APPINSIGHTS_INSTRUMENTATIONKEY=${INSTRUMENTATION_KEY}
APPLICATIONINSIGHTS_CONNECTION_STRING=${CONN_STRING}
EOF

echo "✅ Deployment complete."
echo "📄 app/.env is ready for local testing."

# 🌐 URLs
echo ""
echo "🔗 Access your Azure resources:"
echo "📊 Application Insights Logs:"
echo "👉 https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/microsoft.insights%2Fcomponents"
echo ""
echo "📈 Azure Monitor Workbooks:"
echo "👉 https://portal.azure.com/#blade/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/workbooks"
echo ""

if [[ "$DEPLOY_WEB_APP" == "true" ]]; then
  echo "🌐 Deployed Python Web App:"
  echo "👉 https://${WEB_APP_NAME}.azurewebsites.net/docs"
fi