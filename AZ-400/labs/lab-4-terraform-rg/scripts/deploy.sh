#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🚀 Terraform Deploy Script (Corrected for Storage Prefix)
# -----------------------------------------------------------------------------

function show_help() {
  echo ""
  echo "🚀 Deploy Azure resources using Terraform"
  echo ""
  echo "Usage:"
  echo "  ./deploy.sh <location> <resource-group-name> <storage-account-prefix> <log-analytics-workspace-name>"
  echo ""
}

if [[ "${1:-}" == "--help" || "$#" -ne 4 ]]; then
  show_help
  exit 1
fi

LOCATION=$1
RESOURCE_GROUP_NAME=$2
STORAGE_ACCOUNT_PREFIX=$3
LOG_ANALYTICS_WORKSPACE_NAME=$4

cd "$(dirname "$0")/.."

echo "⚙️ Initializing Terraform..."
terraform init

echo "📝 Planning deployment..."
terraform plan -out=tfplan \
  -var location="$LOCATION" \
  -var resource_group_name="$RESOURCE_GROUP_NAME" \
  -var storage_account_prefix="$STORAGE_ACCOUNT_PREFIX" \
  -var log_analytics_workspace_name="$LOG_ANALYTICS_WORKSPACE_NAME"

echo "🚀 Applying deployment..."
terraform apply "tfplan"

echo "✅ Deployment completed successfully!"