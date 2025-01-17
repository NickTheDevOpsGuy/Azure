#!/bin/bash

# Script to initialize AKS Lab
echo "Creating Azure Kubernetes Service (AKS) cluster in <ResourceGroupName> ..."

# Create Resource Group
az group create --name <ResourceGroupName>  --location eastus

# Create AKS Cluster
az aks create \
  --resource-group <ResourceGroupName> \
  --name AKSCluster \
  --node-count 2 \
  --enable-addons monitoring \
  --ssh-key-value ~/.ssh/id_rsa.pub

# Get AKS credentials
az aks get-credentials --resource-group <ResourceGroupName>  --name AKSCluster

# Deploy application
kubectl apply -f ../manifests/deployment.yaml
kubectl apply -f ../manifests/service.yaml

echo "AKS Lab setup complete!"