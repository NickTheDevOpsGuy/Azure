# Project Title

## 🌍 Lab Goal

Master secure Azure DevOps deployments using:

- Service Connections (Azure Resource Manager)
- Proper RBAC assignments
- Secure deployments without credentials inside your YAML
- Deploy real Azure infrastructure (Resource Group + Storage Account)

---

## 🔧 Prerequisites

- Active Azure Subscription
- Azure DevOps Organization
- Azure DevOps Service Connection (name: `AZURE-SERVICE-CONNECTION`)
- Contributor role assigned to the Service Principal at subscription level (or Resource Group level)
- Azure CLI installed (pre-installed on Azure DevOps Microsoft-hosted agents)

---

## 📁 Project Structure
```plaintext
.
AZ-400/labs/lab-8-service-connections-managed-identities/
├── README.md
├── yaml/
│   └── pipeline-lab-8-deploy.yml
└── assets/
    └── diagram.png
```

---

## 🛠 Tools Used

| Tool | Purpose |
| ---- | ------- |
| **Azure DevOps Pipelines** | CI/CD pipeline orchestration |
| **Azure Resource Manager (ARM)** | Cloud resource management |
| **Azure Service Connection (SPN)** | Secure authentication to Azure |
| **Azure CLI (az)** | Resource provisioning from pipeline |
| **Azure RBAC** | Role-based access control for permissions |
| **Azure Storage Account** | Cloud storage resource |
| **Ubuntu Agent (Microsoft Hosted)** | Build agent VM for running pipeline tasks |

---

## 🧪 Pipeline YAML

pipeline-lab-8-deploy.yml

```yaml
trigger:
- main

variables:
  resourceGroupName: 'lab8-rg'
  location: 'eastus'
  storageAccountName: 'lab8storage${{ variables['Build.BuildId'] }}'

pool:
  vmImage: ubuntu-latest

steps:
- task: AzureCLI@2
  inputs:
    azureSubscription: 'AZURE-SERVICE-CONNECTION'
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
      echo "Creating Resource Group: $(resourceGroupName)"
      az group create --name $(resourceGroupName) --location $(location)

      echo "Creating Storage Account: $(storageAccountName)"
      az storage account create \
        --name $(storageAccountName) \
        --resource-group $(resourceGroupName) \
        --location $(location) \
        --sku Standard_LRS
  displayName: 'Deploy Resource Group & Storage Account'
```

---

## 🔐 Service Connection Setup

1️⃣ Go to Azure DevOps → Project Settings → Service connections
2️⃣ Create new Service Connection → Azure Resource Manager → Service principal (automatic or manual)
3️⃣ Assign Contributor role at subscription or resource group scope
4️⃣ Name your connection: AZURE-SERVICE-CONNECTION
5️⃣ Verify connection works successfully

---

```plaintext
Azure DevOps Pipeline
    |
Service Connection (SPN)
    |
Azure Subscription (RBAC Contributor)
    |
Resource Group (lab8-rg)
    |
Storage Account (lab8storagexxxx)
```

---

📊 AZ-400 Skills Covered

- Secure pipeline authentication
- RBAC access control
- ARM deployments via pipeline
- Service Principal usage
- Infrastructure as Code (Azure CLI mode)

---

## 🔎 References

- [Azure DevOps Service Connections](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml)
- [Azure CLI Storage Account Commands](https://learn.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest)
- [Azure Role-Based Access Control (RBAC) Overview](https://learn.microsoft.com/en-us/azure/role-based-access-control/overview)
- [AzureCLI@2 Task for Azure DevOps Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-cli?view=azure-devops)
- [Azure CLI az group create (Resource Group)](https://learn.microsoft.com/en-us/cli/azure/group?view=azure-cli-latest#az-group-create)
- [Azure CLI az storage account create](https://learn.microsoft.com/en-us/cli/azure/storage/account?view=azure-cli-latest#az-storage-account-create)

---

## 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT