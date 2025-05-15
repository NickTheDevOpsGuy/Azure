#!/bin/bash

# 🧼 Cleanup Script: Destroys all resources in a given Azure Resource Group
set -e

RESOURCE_GROUP="$1"

# 🆘 Help text
if [[ "$1" == "--help" || "$1" == "-h" || -z "$RESOURCE_GROUP" ]]; then
  echo -e "🧽 Usage: ./cleanup.sh <resource-group-name>"
  echo -e "   💡 This will DELETE ALL resources in the specified resource group"
  echo -e "   🛑 Example: ./cleanup.sh my-devops-rg"
  exit 0
fi

echo "🧹 Starting cleanup of resource group: $RESOURCE_GROUP"

# Check if the resource group exists
if ! az group show --name "$RESOURCE_GROUP" &>/dev/null; then
  echo "❌ Resource group '$RESOURCE_GROUP' does not exist in your current subscription"
  exit 1
fi

# Delete the resource group
echo "⚠️  Deleting resource group: $RESOURCE_GROUP ..."
az group delete --name "$RESOURCE_GROUP" --yes --no-wait

echo "✅ Deletion initiated. Check Azure Portal or run:"
echo "   az group show --name $RESOURCE_GROUP"
echo "   az group wait --deleted --name $RESOURCE_GROUP"