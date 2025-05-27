# AZ-400 Instrumentation Lab

## 📝 Description
Brief description of what this project does and who it's for.

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
├── infra/
│   ├── main.bicep
│   └── modules/
├── app/
│   ├── index.js
│   ├── views/
│   ├── public/
│   └── .env.example
├── queries/
│   ├── homepage-requests.kql
│   ├── errors.kql
│   ├── custom-metrics.kql
│   └── health-checks.kql
└── README.md
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