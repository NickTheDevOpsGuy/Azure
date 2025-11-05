# ☁️ Azure Infrastructure Labs (Bicep + DevOps Automation)

## Overview

This repository contains hands-on Azure labs showcasing real-world Infrastructure as Code (IaC) deployments using **Bicep**, **Azure CLI**, and **DevOps best practices**.

Each lab is fully automated with deployment and cleanup scripts, designed to demonstrate key Azure cloud skills across **storage**, **networking**, and **security** scenarios.

✅ Cloud Native  
✅ Automated  
✅ Secure  
✅ GitHub-Ready  
✅ Interview-Ready

---

## Labs Included

| Lab | Description | Key Concepts |
|:---|:-------------|:-------------|
| [Lab 1: Storage + Monitoring](./lab-1-monitoring-storage) | Deploy Storage Account + Monitor with Log Analytics | Azure Monitor, Storage, Diagnostics, Log Analytics, Observability |
| [Lab 2: Storage + Private Endpoint](./lab-2-storage-private-endpoint) | Deploy Storage with Private Access via Private Link | Private Endpoint, VNet, Subnet, Private DNS, Storage Security |
| [Lab 3: Key Vault + Secret](./lab-3-keyvault-secret) | Deploy Key Vault + Securely Store a Secret | Key Vault, Secret Management, Access Policies, Azure AD Identity |

---

## 🚀 Quickstart

Each lab folder contains:

- `main.bicep` — Infrastructure as Code
- `deploy.sh` — Automated Deployment Script
- `cleanup.sh` — Automated Cleanup Script
- `README.md` — Lab Instructions and Diagrams

### Example Commands

## 🛠️ Deployment Steps

```bash
cd Azure/lab-1-monitoring-storage
./deploy.sh <resource-group> <location> <prefixes>
```

## 📂 Project Structure

```plaintext
Azure/
└── lab-4-terraform-rg-storage-monitoring/
    ├── main.tf          # Terraform config
    ├── variables.tf     # Terraform variables
    ├── outputs.tf       # Terraform outputs
    ├── README.md        # Lab instructions
    └── scripts/         # 🚀 Scripts neatly organized
        ├── deploy.sh    # Init / Plan / Apply
        └── destroy.sh   # Destroy everything
```

---

---

## 🦝 Built by NickDoesDevOps

Created with ☕, curiosity, and a touch of chaos by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops).  
Follow the journey → [GitHub](https://github.com/NickTheDevOpsGuy) • [LinkedIn](https://www.linkedin.com/in/nickdoesdevops)

🏷 #NickDoesDevOps • #LearningInPublic • #BuiltInPublic