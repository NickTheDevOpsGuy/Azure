#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# ☸️ AZ-400 Voting DevOps Lab Setup Script
# -----------------------------------------------------------------------------

# 🧾 Usage instructions
function show_help() {
  echo ""
  echo "Usage: ./scripts/setup.sh <environment> <resource-group> <location>"
  echo ""
  echo "Example:"
  echo "  ./scripts/setup.sh dev devops-rg eastus"
  echo ""
  exit 1
}

# 🌱 Inputs
ENVIRONMENT="${1:-}"
RESOURCE_GROUP="${2:-}"
LOCATION="${3:-}"

if [[ -z "$ENVIRONMENT" || -z "$RESOURCE_GROUP" || -z "$LOCATION" ]]; then
  show_help
fi

echo ""
echo "📦 Resource Group: $RESOURCE_GROUP"
echo "📍 Location:       $LOCATION"
echo "🌿 Environment:    $ENVIRONMENT"
echo ""

# ⛳️ Create Resource Group if needed
echo "🛠️  Creating resource group (if not exists)..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --output none

# 🚀 Deploy Bicep
echo "🚀 Deploying infrastructure from main.bicep..."
deployment_output=$(az deployment group create \
  --resource-group "$RESOURCE_GROUP" \
  --template-file ./bicep/main.bicep \
  --parameters environment="$ENVIRONMENT" location="$LOCATION" \
  --query "properties.outputs" \
  --output json)

# ✅ Display all outputs
echo ""
echo "✅ Deployment Outputs:"
echo "$deployment_output" | jq .

# 🔍 Extract specific AKS values
aks_name=$(echo "$deployment_output" | jq -r '.aksName.value // empty')
aks_fqdn=$(echo "$deployment_output" | jq -r '.aksFqdn.value // empty')
aks_version=$(echo "$deployment_output" | jq -r '.aksVersion.value // empty')

if [[ -n "$aks_name" ]]; then
  echo ""
  echo "☸️ AKS Cluster Info:"
  echo "🔹 Name:        $aks_name"
  echo "🔹 Version:     $aks_version"
  echo "🔹 API Server:  $aks_fqdn"
fi