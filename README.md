# 🚀 Azure Projects and Labs

This section of the repository is dedicated to Azure-based projects and labs, showcasing expertise in deploying and managing cloud resources, implementing Infrastructure as Code (IaC) with **Bicep** and **Terraform**, and setting up advanced **DevOps automation** practices.

---

## 📂 Projects Overview

### 1. **Azure Kubernetes Service (AKS)**
   - **Description:** A sample Kubernetes project.
   - **Key Features:**
     - Automates testing, building, and deployment.
     - Supports containerized applications (Kubernetes).
     - Integrates with Kubernetes for deployments.
   - **Technologies:** Kubernetes.
   - **Repository:** [View Project](./AZ-400/labs/aks-lab)

---

## 📂 Labs Overview

### 2. **Lab 1: Storage + Monitoring (Bicep)**
   - **Description:** Deploys a Storage Account with diagnostic settings sending data to Azure Monitor via Log Analytics.
   - **Key Features:**
     - Automated Storage Account and Log Analytics deployment.
     - Azure Monitor integration.
     - Full Infrastructure as Code (Bicep).
   - **Technologies:** Azure Storage, Azure Monitor, Log Analytics, Bicep.
   - **Repository:** [View Lab](./lab-1-monitoring-storage/)

---

### 3. **Lab 2: Storage + Private Endpoint (Bicep)**
   - **Description:** Deploys a Storage Account with a Private Endpoint and Private DNS Zone for secure access.
   - **Key Features:**
     - Private Link networking.
     - DNS Zone integration.
     - Fully automated via Bicep and bash scripts.
   - **Technologies:** Private Link, VNet, DNS, Bicep.
   - **Repository:** [View Lab](./lab-2-storage-private-endpoint/)

---

### 4. **Lab 3: Key Vault + Secret Management (Bicep)**
   - **Description:** Deploys an Azure Key Vault with a sample secret and access policies for secure management.
   - **Key Features:**
     - Secure secret handling with `@secure()` attributes.
     - Identity and Access Management (IAM) integration.
     - Full Infrastructure as Code (Bicep).
   - **Technologies:** Key Vault, Azure AD, Secrets, Bicep.
   - **Repository:** [View Lab](./lab-3-keyvault-secret/)

---

### 5. **Lab 4: Resource Group + Storage + Monitoring (Terraform)**
   - **Description:** Deploys an Azure Resource Group, Storage Account, and Log Analytics Workspace using Terraform.
   - **Key Features:**
     - Full Infrastructure as Code using Terraform HCL.
     - Automated deploy/destroy/reset scripts.
     - Clean DevOps automation with scripts.
   - **Technologies:** Terraform, Azure CLI, Azure Storage, Log Analytics.
   - **Repository:** [View Lab](./lab-4-terraform-rg-storage-monitoring/)

---

# 🛠️ Skills Demonstrated

- Infrastructure as Code (Bicep, Terraform)
- Azure Resource Management
- Azure Monitoring and Observability
- Private Networking (Private Endpoints, DNS)
- Key Vault and Secrets Management
- DevOps Automation (Bash scripting)
- Clean Deployment and Cleanup Practices

---

# 📚 References

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview)
- [Terraform Documentation](https://developer.hashicorp.com/terraform)
- [Azure Private Link Documentation](https://learn.microsoft.com/en-us/azure/private-link/private-link-overview)
- [Azure Monitor Documentation](https://learn.microsoft.com/en-us/azure/azure-monitor/overview)
- [Azure Key Vault Documentation](https://learn.microsoft.com/en-us/azure/key-vault/general/overview)

---
