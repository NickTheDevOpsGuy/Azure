#!/bin/bash
echo "Setting up full infrastructure..."
#!/bin/bash
set -e

echo "🚀 Deploying infrastructure..."
az group create --name devops-rg --location eastus
az deployment group create \
  --resource-group devops-rg \
  --template-file bicep/main.bicep \
  --parameters environment=dev