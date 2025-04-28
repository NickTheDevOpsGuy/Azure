#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🚀 Deploy Azure Key Vault + Secret
# -----------------------------------------------------------------------------

function show_help() {
  echo ""
  echo "🔐 Deploys an Azure Key Vault and creates a secret using Bicep"
  echo ""
  echo "Usage:"
  echo "  ./deploy.sh <resource-group> <location> <keyvault-prefix> <secret-name> <secret-value> <admin-object-id>"
  echo ""
  echo "Arguments:"
  echo "  <resource-group>    Azure Resource Group name"
  echo "  <location>          Azure Region (e.g., eastus)"
  echo "  <keyvault-prefix>   Prefix for the Key Vault name (lowercase, alphanumeric)"
  echo "  <secret-name>       Name of the secret to create"
  echo "  <secret-value>      Value of the secret"
  echo "  <admin-object-id>   Azure AD Object ID for Key Vault access"
  echo ""
}

if [[ "${1:-}" == "--help" || "$#" -ne 6 ]]; then
  show_help
  exit 1
fi

RESOURCE_GROUP=$1
LOCATION=$2
KEYVAULT_PREFIX=$3
SECRET_NAME=$4
SECRET_VALUE=$5
ADMIN_OBJECT_ID=$6

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
    keyVaultPrefix="$KEYVAULT_PREFIX" \
    secretName="$SECRET_NAME" \
    secretValue="$SECRET_VALUE" \
    adminObjectId="$ADMIN_OBJECT_ID" \
  --query "properties.provisioningState"

echo "✅ Deployment completed successfully!"