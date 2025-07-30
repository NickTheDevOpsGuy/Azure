# AZ-400 Instrumentation Lab

## 📝 Description
Brief description of what this project does and who it's for.

## 🧪 GitHub Actions CI/CD

This repo includes a GitHub Actions workflow that deploys the entire solution—infra and app—with a single click 🚀.

📂 Workflow File:

```bash 
deploy-lab5.yml
```

📌 What it does:

- Deploys Log Analytics + Application Insights using Bicep
- Deploys Azure Web App and links it to App Insights
- Builds and deploys the Node.js monitoring demo app

🟢 Trigger manually via GitHub UI → Actions → “Deploy Lab 5 - Instrumentation Lab”

## 🚀 Getting Started

### 📦 Prerequisites
- Azure CLI installed and logged in
- Node.js v18+ installed
- Azure subscription

### 🔧 Deploy Infrastructure
Run the following to deploy App Insights and Log Analytics workspace:

```bash
az deployment group create \
  --resource-group <your-rg> \
  --template-file infra/main.bicep \
  --parameters location=<azure-region> environment=dev
```

Note the outputs: `appInsightsInstrumentationKey` and `logAnalyticsWorkspaceId`.

### 💻 Set Up the App

```bash
cd app
cp .env.example .env
# Paste your APPINSIGHTS_INSTRUMENTATIONKEY from deployment output into .env
npm install
npm start
```

Then visit:
- `http://localhost:3000/` – homepage
- `/health` – uptime and system info
- `/simulate-error` – triggers an exception
- `/custom-metric` – sends random latency metric

## 📊 Queries
KQL examples are available in `/queries/`:
- Homepage hits
- Exceptions
- Health checks
- Custom metrics


## 📁 Project Structure
```
.
├── .gitignore
├── app
│   ├── .env
│   ├── index.js
│   ├── package-lock.json
│   ├── package.json
│   ├── public
│   │   └── styles.css
│   └── views
│       └── index.html
├── bicep
│   ├── main.bicep
│   ├── modules
│   │   ├── app-insights.bicep
│   │   ├── log-analytics.bicep
│   │   └── webapp.bicep
│   └── parameters.dev.json
├── package-lock.json
├── queries
│   ├── custom-metrics.kql
│   ├── errors.kql
│   ├── health-checks.kql
│   └── homepage-requests.kql
├── scripts
│   ├── deploy.sh
│   ├── cleanup.sh
```

## 🔧 Tools Used
- Azure Bicep
- Application Insights
- Log Analytics

## 🙋‍♂️ About the Author
Built with 💻 by [Nicholas Clark](https://www.linkedin.com/in/nickdoesdevops)

- Follow the journey: #NickDoesDevOPS
- GitHub: [NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)

## 📄 License
MIT