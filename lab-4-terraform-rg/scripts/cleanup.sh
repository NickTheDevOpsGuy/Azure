#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# 🧹 Terraform Cleanup Script
# -----------------------------------------------------------------------------

function show_help() {
  echo ""
  echo "🧹 Cleans up local Terraform files and resets the environment"
  echo ""
  echo "Usage:"
  echo "  ./cleanup.sh"
  echo ""
}

if [[ "${1:-}" == "--help" || "$#" -ne 0 ]]; then
  show_help
  exit 1
fi

cd "$(dirname "$0")/.."

echo "🧹 Cleaning local Terraform files..."

# Remove plan file if exists
if [[ -f "tfplan" ]]; then
  echo "🗑️ Deleting tfplan..."
  rm -f tfplan
fi

# Remove Terraform state files if exist
if [[ -f "terraform.tfstate" || -f "terraform.tfstate.backup" ]]; then
  echo "🗑️ Deleting Terraform state files..."
  rm -f terraform.tfstate terraform.tfstate.backup
fi

# Remove .terraform folder if exists
if [[ -d ".terraform" ]]; then
  echo "🗑️ Deleting .terraform directory..."
  rm -rf .terraform
fi

echo "✅ Local Terraform environment cleaned up!"