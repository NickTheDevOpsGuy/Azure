# Project Title

## 📝 Description
Brief description of what this project does and who it's for.

## 🚀 Getting Started
- Clone the repo
- Run `bicep build infra/main.bicep`
- Deploy using Azure CLI or GitHub Actions

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

## 🔧 Tools Used
- Azure Bicep
- Application Insights
- Log Analytics

## 🙋‍♂️ About the Author

Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS

🧠 #NickDoesDevOps
🚀 #LearningInPublic
🔧 #WorldDominations

- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT