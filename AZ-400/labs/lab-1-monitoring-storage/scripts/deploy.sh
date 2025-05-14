#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🚀 Deploy Storage Account + Azure Monitor Diagnostic Settings
# -----------------------------------------------------------------------------

function show_help() {
  echo ""
  echo "📦 Deploys Storage Account with Azure Monitor diagnostic settings using Bicep"
  echo ""
  echo "Usage:"
  echo "  ./deploy.sh <resource-group> <location> <storage-prefix> <log-analytics-name>"
  echo ""
  echo "Arguments:"
  echo "  <resource-group>         Azure Resource Group name"
  echo "  <location>               Azure Region (e.g., eastus)"
  echo "  <storage-prefix>         Prefix for Storage Account (must be lowercase and alphanumeric)"
  echo "  <log-analytics-name>     Unique Log Analytics Workspace name"
  echo ""
}

if [[ "${1:-}" == "--help" || "$#" -ne 4 ]]; then
  show_help
  exit 1
fi

RESOURCE_GROUP=$1
LOCATION=$2
STORAGE_PREFIX=$3
LOG_ANALYTICS_NAME=$4

echo "🔎 Checking if resource group '$RESOURCE_GROUP' exists..."

if ! az group show --name "$RESOURCE_GROUP" &>/dev/null; then
  echo "⚙️  Resource group '$RESOURCE_GROUP' not found. Creating it..."
  az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
  echo "✅ Resource group '$RESOURCE_GROUP' created."
else
  echo "✅ Resource group '$RESOURCE_GROUP' already exists."
fi

echo "🚀 Starting deployment to resource group '$RESOURCE_GROUP' in '$LOCATION'..."

az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file main.bicep \
  --parameters \
    location="$LOCATION" \
    storagePrefix="$STORAGE_PREFIX" \
    logAnalyticsName="$LOG_ANALYTICS_NAME" \
  --query "properties.provisioningState"

echo "✅ Deployment completed successfully!"