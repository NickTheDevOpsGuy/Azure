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
   - **Repository:** [View Lab](./AZ-400/labs/lab-1-monitoring-storage/)

---

### 3. **Lab 2: Storage + Private Endpoint (Bicep)**
   - **Description:** Deploys a Storage Account with a Private Endpoint and Private DNS Zone for secure access.
   - **Key Features:**
     - Private Link networking.
     - DNS Zone integration.
     - Fully automated via Bicep and bash scripts.
   - **Technologies:** Private Link, VNet, DNS, Bicep.
   - **Repository:** [View Lab](./AZ-400/labs/lab-2-storage-private-endpoint/)

---

### 4. **Lab 3: Key Vault + Secret Management (Bicep)**
   - **Description:** Deploys an Azure Key Vault with a sample secret and access policies for secure management.
   - **Key Features:**
     - Secure secret handling with `@secure()` attributes.
     - Identity and Access Management (IAM) integration.
     - Full Infrastructure as Code (Bicep).
   - **Technologies:** Key Vault, Azure AD, Secrets, Bicep.
   - **Repository:** [View Lab](./AZ-400/labs/lab-3-keyvault-secret/)

---

### 5. **📡 Lab 5: AZ-400 Instrumentation Lab – App Insights + Node.js**
   - **Description:** Add observability to a Node.js web app using Azure Application Insights. Tracks requests, failures, dependencies, and more for AZ-400 monitoring prep.
   - **Key Features:**
     - Tracks requests, exceptions, and dependencies.
     - Supports both classic SDK and OpenTelemetry export.
     - repares for integration with Azure Monitor alerts and dashboards.
   - **Technologies:** Node.js · Express · Azure Application Insights · dotenv · Azure CLI
   - **Repository:** [View Lab](./AZ-400/labs/lab-5-az400-instrumentation-lab)

---

### 6. 🗂️ Lab 6: DevOps Project Tracking – Azure Boards + GitHub Integration
   - **Description:** Connect GitHub commits to Azure Boards work items for seamless project tracking and traceability. This lab demonstrates auto-linking, commit syntax, and board views as part of AZ-400 collaboration practices.
	- **Key Features:**
	- Auto-links commits to work items using AB# syntax.
     - Supports state transitions with keywords like Fixes and Resolves.
     - Includes board permission tips, query samples, and tracking views.
   - **Technologies:** Azure Boards · GitHub · DevOps Project Management · Markdown Docs
   - **Repository:** [View Lab](./AZ-400/labs/lab-6-devops-project-tracking-azure-boards-github)

---

### 6. 🗂️ Lab 7 - Azure DevOps Pipeline Variable Scope
   - **Description:** Hands-on lab focused on mastering Azure DevOps Pipeline variables across multiple scopes. Includes pipeline-level, stage-level, job-level variables, variable groups, runtime expressions, and secret variable handling. This lab is fully AZ-400 exam aligned to practice variable resolution and precedence.
	- **Key Features:**
	- 6 separate YAML pipelines covering variable scoping concepts
- Pipeline-scoped variables with global access
- Stage-scoped overrides across multiple deployment stages
- Job-scoped isolated variables per deployment job
- Variable Groups integration for externalized values and secrets
- Runtime expressions using Azure DevOps counter() function
- Secret variable masking behavior validated in pipeline logs
- Fully reusable YAML templates for reference and future projects
   - **Technologies:** Azure DevOps Pipelines, YAML, Variable Groups, Secret Variables, Runtime Expressions
   - **Repository:** [View Lab](./AZ-400/labs/lab-7-pipelines-variable-scope)

---

### 6. 🗂️ Lab 8 - Service Connections & Managed Identities
   - **Description:** Connect GitHub commits to Azure Boards work items for seamless project tracking and traceability. This lab demonstrates auto-linking, commit syntax, and board views as part of AZ-400 collaboration practices.
	- **Key Features:**
	- Auto-links commits to work items using AB# syntax.
     - Supports state transitions with keywords like Fixes and Resolves.
     - Includes board permission tips, query samples, and tracking views.
   - **Technologies:** Azure Boards · GitHub · DevOps Project Management · Markdown Docs
   - **Repository:** [View Lab](./AZ-400/labs/llab-8-service-connections-managed-identities)

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
