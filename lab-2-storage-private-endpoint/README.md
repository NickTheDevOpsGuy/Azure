# Lab 2: Deploy Azure Storage Account with Private Endpoint

## Overview

This lab deploys an Azure Storage Account and configures a Private Endpoint connecting it securely to a Virtual Network (VNet) using Azure Private Link.  
It also creates a Private DNS Zone for internal name resolution of the Storage Account's Blob service.

This setup demonstrates private access to Azure services without exposing public endpoints.

---

## Resources Deployed

| Resource Type | Purpose |
|:--------------|:--------|
| Storage Account | Object storage (Blob service) |
| Virtual Network (VNet) | Isolated private network |
| Subnet | Subnet inside the VNet, configured for Private Endpoints |
| Private Endpoint | Private connection to the Storage Account |
| Private DNS Zone | DNS resolution for the private Storage Account blob endpoint |
| DNS Zone Link | Links the VNet to the Private DNS Zone |

---

## Prerequisites

- Azure CLI installed and logged in
- Sufficient Azure subscription permissions to deploy networking and storage resources

---

## Deployment Steps

1. Clone the repository (if not already):
   ```bash
   git clone <your-repo-url>
   cd Azure/lab-2-storage-private-endpoint
   ```

## 📂 Project Structure

```plaintext
Azure/
└── lab-2-storage-private-endpoint/
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