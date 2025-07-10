# 🗳️ Azure Voting DevOps Lab

A modern DevOps lab to deploy the classic Azure Voting App using Infrastructure as Code (Bicep) and GitHub Actions. This lab focuses on **infrastructure provisioning**, with planned future phases for **CI/CD**, **monitoring**, and **security**.

---

## 📦 Lab Overview

| Phase | Description |
|-------|-------------|
| ✅ Phase 1 | Provision core infrastructure using Bicep |
| 🔜 Phase 2 | CI/CD pipeline to build, test, and deploy the voting app |
| 🔜 Phase 3 | Monitoring with Azure Monitor + Application Insights |
| 🔜 Phase 4 | Security hardening, Defender for DevOps, policy controls |

---

## 🧱 Infrastructure (Phase 1)

This lab provisions:

- 🧠 **Azure Kubernetes Service (AKS)** cluster with Azure CNI
- 🌐 **Virtual Network + Subnet**
- 🔐 **Azure Key Vault** with soft-delete enabled
- 📈 **Log Analytics Workspace**
- 👁️ **Network Watcher** in the same resource group

---

## 📁 Project Structure
```plaintext
azure-voting-devops/
│
├── .github/workflows/
│   ├── build.yml                  # Lint, test, scan, build Docker images
│   ├── deploy-dev.yml             # Deploy to dev via Helm
│   ├── deploy-staging.yml         # Manual approval + deploy
│   └── deploy-prod.yml            # Approval gate + rollout
│
├── bicep/
│   ├── main.bicep                 # Entry point with env param
│   ├── network.bicep              # VNet + Subnets
│   ├── aks.bicep                  # AKS cluster with RBAC, CSI
│   ├── keyvault.bicep             # Azure Key Vault for secrets
│   └── loganalytics.bicep         # For App Insights + Grafana
│
├── helm/
│   ├── Chart.yaml
│   ├── templates/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── ingress.yaml
│   └── values/
│       ├── dev.yaml
│       ├── staging.yaml
│       └── prod.yaml
│
├── manifests/
│   ├── flux/
│   │   ├── kustomization.yaml
│   │   └── helmrelease.yaml
│   └── monitoring/
│       ├── prometheus-rules.yaml
│       └── grafana-dashboard.json
│
├── src/
│   ├── frontend/
│   │   ├── Dockerfile
│   │   └── index.html
│   ├── api/
│   │   ├── Dockerfile
│   │   └── app.py                  # Flask or FastAPI with metrics
│   └── shared/
│       └── .env.template
│
├── monitoring/
│   ├── dashboards/
│   │   └── voting-app-overview.json
│   ├── alerts/
│   │   ├── latency.yaml
│   │   └── errors.yaml
│   └── kql/
│       ├── request-metrics.kql
│       └── failed-requests.kql
│
├── scripts/
│   ├── setup.sh                   # Full infra deploy
│   ├── cleanup.sh                 # Teardown
│   └── validate.sh                # Run Bicep + Helm + tests
│
└── README.md
```

---

## 🚀 Getting Started

### ⚙️ Prerequisites

- Azure CLI ✅
- Bicep CLI (comes with latest Azure CLI) ✅
- Logged into Azure via `az login` ✅
- jq (for pretty-printing outputs)

---

### 🛠️ Deploy the Lab

```bash
./scripts/setup.sh [environment] [resource-group] [location]
```

This will:
* Create the resource group (if it doesn’t exist)
* Deploy all Bicep modules
* Print AKS outputs (name, version, FQDN)

---

### ☸️ AKS Outputs (Sample)

```json
{
  "aksName": { "value": "dev-aks" },
  "aksFqdn": { "value": "dev-aks-abc123.hcp.eastus.azmk8s.io" },
  "aksVersion": { "value": "1.28.5" }
}
```

---

### 🧪 Next Steps

We will incrementally improve this lab with:
* 🧪 Phase 2: CI/CD pipeline using GitHub Actions
* 📊 Phase 3: App monitoring via Azure Monitor & Application Insights
* 🔐 Phase 4: Add Azure Defender and policy compliance

---

### 🤖 Built With
* Bicep
* Azure CLI
* AKS
* Log Analytics

### 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT