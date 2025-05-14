#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🧹 Cleanup: Delete Entire Resource Group
# -----------------------------------------------------------------------------

function show_help() {
  echo ""
  echo "🧹 Deletes ALL resources inside a specified Azure Resource Group"
  echo ""
  echo "Usage:"
  echo "  ./cleanup.sh <resource-group>"
  echo ""
  echo "Arguments:"
  echo "  <resource-group>   Name of the Azure Resource Group to clean up"
  echo ""
}

if [[ "${1:-}" == "--help" || "$#" -ne 1 ]]; then
  show_help
  exit 1
fi

RESOURCE_GROUP=$1

echo "⚡ Starting cleanup..."

echo "🔎 Checking if resource group '$RESOURCE_GROUP' exists..."
if ! az group show --name "$RESOURCE_GROUP" &>/dev/null; then
  echo "❌ Resource group '$RESOURCE_GROUP' does not exist."
  exit 1
fi

echo "🗑️ Deleting all resources inside resource group: $RESOURCE_GROUP"
az group delete --name "$RESOURCE_GROUP" --yes --no-wait

echo "✅ Resource group deletion initiated."