#!/bin/bash
set -e

# 🛠️ Azure Voting App - Infrastructure Setup Script
# This script provisions the full AKS environment using Bicep templates.

# Defaults (can be overridden by environment variables)
RESOURCE_GROUP=${RESOURCE_GROUP:-"devops-rg"}
LOCATION=${LOCATION:-"eastus"}
ENVIRONMENT=${ENVIRONMENT:-"dev"}

# 💬 Show current configuration
echo "📦 Resource Group: $RESOURCE_GROUP"
echo "📍 Location: $LOCATION"
echo "🌱 Environment: $ENVIRONMENT"

# 🚀 Deploy infrastructure
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ../bicep/main.bicep \
  --parameters environment="$ENVIRONMENT"

echo "✅ Deployment complete!"
echo "🧭 Explore your resources in the Azure Portal or use Azure CLI to verify."