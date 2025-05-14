#!/bin/bash

# Script to clean up AKS Lab resources
echo "Deleting AKS cluster and resource group..."

# Delete AKS Cluster
az aks delete --name AKSCluster --resource-group <ResourceGroupName>  --yes

# Delete Resource Group
az group delete --name <ResourceGroupName>  --yes

echo "Cleanup complete!"
