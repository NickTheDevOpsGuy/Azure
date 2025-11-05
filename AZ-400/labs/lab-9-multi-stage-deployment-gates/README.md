### 🦝 AZ-400 Lab 9: Multi-Stage Pipelines with Deployment Gates

## 📝 Description

This lab focuses on building fully gated multi-stage pipelines inside Azure DevOps with real deployments to Azure, secured via service connections, and promotion gates managed through environment approvals. It simulates real-world CI/CD patterns directly aligned with AZ-400 exam objectives.

---

## 🌍 Lab Goal

- Deploys real Azure resources across stages
- Uses Azure DevOps Environments and manual approvals
- Fully simulates real-world gated deployment flows
- Reinforces both AZ-400 exam topics and real DevOps job scenarios

---

## 🔧 Prerequisites

- Active Azure Subscription
- Azure DevOps Organization
- Azure DevOps Service Connection (`AZURE-SERVICE-CONNECTION`)
- Azure DevOps Environments created:
  - `Dev`
  - `Staging`
  - `Production`
- Contributor role assigned to the Service Principal

---

## 📁 Project Structure
```plaintext
.
├── AZ-400/labs/lab-9-multi-stage-deployment-gates/
├── README.md
├── yaml/
│   └── pipeline-lab-9-deploy.yml
└── assets/
    └── diagram.png
```

---

## 🛠 Technologies Used:

| Tool | Purpose |
| ---- | ------- |
| **Azure DevOps Pipelines** | CI/CD orchestration |
| **Azure DevOps Environments** | Stage separation & approvals |
| **Azure Service Connections** | Secure Azure access |
| **Azure CLI (az)** | Resource deployment |
| **Azure Resource Manager (ARM)** | Infrastructure provisioning |
| **RBAC** | Role-based access control |
| **Azure Storage Account** | Sample resource provisioned |
| **Ubuntu Agent (Microsoft Hosted)** | Build agent pool |

---

## 📝 Deployment Diagram

```plaintext
Azure DevOps Pipeline (Multi-Stage)
    |
    |-- Dev Stage (Auto Deploy)
    |
    |-- Staging Stage (Manual Approval)
    |
    |-- Production Stage (Manual Approval)
    |
    |--> Azure Resource Group + Storage Account deployed at each stage
```

---

## 📊 AZ-400 Skills Covered
- Multi-stage YAML pipelines
- Deployment gates and approvals
- Secure resource deployments
- RBAC access control via Service Connections
- Promotion flow management
- Real-world production pipeline simulation

---

## 🔎 References

- [Azure DevOps Multi-stage Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/stages)
- [Azure DevOps Environments](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/environments)
- [Azure Deployment Approvals](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/environment-approvals-checks)
- [AzureCLI@2 Task](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-cli)
- [Azure Storage Account CLI](https://learn.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-create)
- [Azure RBAC Overview](https://learn.microsoft.com/en-us/azure/role-based-access-control/overview)

---

## 🦝 Built by NickDoesDevOps

Created with ☕, curiosity, and a touch of chaos by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops).  
Follow the journey → [GitHub](https://github.com/NickTheDevOpsGuy) • [LinkedIn](https://www.linkedin.com/in/nickdoesdevops)

🏷 #NickDoesDevOps • #LearningInPublic • #BuiltInPublic