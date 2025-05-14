# Lab 1: Deploy Storage Account with Azure Monitor Diagnostic Settings

## Overview
This lab deploys a Storage Account and a Log Analytics workspace using Bicep, and configures diagnostic settings to send Storage logs to Log Analytics.

## Resources Created
- Azure Storage Account (Standard_LRS)
- Azure Log Analytics Workspace
- Diagnostic Setting (logs: StorageRead, StorageWrite, StorageDelete)

## Prerequisites
- Azure CLI installed and logged in
- Existing Resource Group created

## 📂 Project Structure

```plaintext
Azure/
└── lab-1-monitoring-storage/
    ├── main.bicep
    ├── README.md
    └── deploy.sh
├── scripts/
│   ├── cleanup.sh        
│   └── deploy.sh
```

## 🛠️ Deployment Steps
1. Set your variables:
   ```bash
   RESOURCE_GROUP=<your-resource-group>
   LOCATION=<your-location>
   STORAGE_NAME=<unique-storage-name>
   LOG_ANALYTICS_NAME=<unique-log-name>
   ```