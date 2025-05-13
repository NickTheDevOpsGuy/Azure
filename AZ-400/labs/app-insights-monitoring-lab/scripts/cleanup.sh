#!/bin/bash

# -------------------------------
# 💣 AZ-400 App Insights Cleanup
# -------------------------------

set -e

RESOURCE_GROUP="NickClarkRG"
ENVIRONMENT="${1:-dev}"
LOCATION="eastus2"

APP_INSIGHTS_NAME="appinsights-${ENVIRONMENT}-nick"
LOG_ANALYTICS_NAME="log-${ENVIRONMENT}-nick"
WEB_APP_NAME="insightswebapp-${ENVIRONMENT}-nick"
APP_PLAN_NAME="asp-${ENVIRONMENT}-nick"

echo "⚠️  This will delete all resources created by the App Insights Monitoring Lab for environment: ${ENVIRONMENT}"
read -p "Continue? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
  echo "❌ Aborted."
  exit 1
fi

echo "🧹 Deleting Web App..."
az webapp delete --name "$WEB_APP_NAME" --resource-group "$RESOURCE_GROUP" || echo "🔸 Web App not found or already deleted."

echo "🧹 Deleting App Service Plan..."
az appservice plan delete --name "$APP_PLAN_NAME" --resource-group "$RESOURCE_GROUP" --yes || echo "🔸 App Service Plan not found or already deleted."

echo "🧹 Deleting Application Insights..."
az resource delete --ids $(az resource show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$APP_INSIGHTS_NAME" \
  --resource-type "Microsoft.Insights/components" \
  --query id -o tsv) || echo "🔸 App Insights not found or already deleted."

echo "🧹 Deleting Log Analytics Workspace..."
az monitor log-analytics workspace delete \
  --resource-group "$RESOURCE_GROUP" \
  --workspace-name "$LOG_ANALYTICS_NAME" \
  --yes || echo "🔸 Log Analytics workspace not found or already deleted."

echo "✅ Cleanup complete."