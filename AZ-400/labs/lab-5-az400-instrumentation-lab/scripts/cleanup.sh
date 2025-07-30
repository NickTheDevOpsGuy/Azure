#!/bin/bash

RESOURCE_GROUP="NickClarkRG"

echo "⚠️  This will delete resource group: $RESOURCE_GROUP"
read -p "Are you sure? (y/N): " confirm
if [[ "$confirm" != "y" ]]; then
  echo "❌ Aborted cleanup."
  exit 1
fi

echo "🧨 Deleting resource group..."
az group delete --name "$RESOURCE_GROUP" --yes --no-wait

echo "🧼 Cleanup initiated. Resources are being deleted asynchronously."