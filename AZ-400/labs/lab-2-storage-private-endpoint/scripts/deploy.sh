#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🚀 Deploy Storage Account + Private Endpoint
# -----------------------------------------------------------------------------

function show_help() {
  echo ""
  echo "📦 Deploys a Storage Account with Private Endpoint using Bicep"
  echo ""
  echo "Usage:"
  echo "  ./deploy.sh <resource-group> <location> <storage-prefix>"
  echo ""
  echo "Arguments:"
  echo "  <resource-group>   Azure Resource Group name"
  echo "  <location>         Azure Region (e.g., eastus)"
  echo "  <storage-prefix>   Prefix for Storage Account name (lowercase, alphanumeric)"
  echo ""
}

if [[ "${1:-}" == "--help" || "$#" -ne 3 ]]; then
  show_help
  exit 1
fi

RESOURCE_GROUP=$1
LOCATION=$2
STORAGE_PREFIX=$3

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
  --query "properties.provisioningState"

echo "✅ Deployment completed successfully!"