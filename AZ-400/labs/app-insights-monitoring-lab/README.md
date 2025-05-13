# 📊 App Insights Monitoring Lab (AZ-400)

This lab walks you through setting up a **real-world monitoring and instrumentation strategy** using Azure-native tools like **Application Insights**, **Log Analytics**, **KQL**, and **Azure Workbooks**.

You'll deploy a FastAPI app that tracks custom events, errors, and dependency calls, then visualize that data using Azure dashboards and alerting rules — aligning directly with the **AZ-400 DevOps certification objectives**.

---

## 🚀 What You'll Learn

- 🚀 Deploy App Insights + Log Analytics via Bicep
- 🧠 Instrument a real FastAPI app to log:
  - Custom events (`track_event`)
  - Exceptions (`track_exception`)
  - HTTP dependency calls (e.g., to other URLs)
- 🔍 Query logs using Kusto Query Language (KQL)
- 📊 Visualize data with Azure Workbooks
- 🔔 Create alerts for failures, latency, and exceptions

---

## 📁 Folder Structure

## 📁 Folder Structure

```plaintext
app-insights-monitoring-lab/
├── app/
│   ├── main.py                      # FastAPI app entrypoint
│   ├── requirements.txt             # Python dependencies
│   ├── startup.txt                  # Tell Azure how to start the python app
│   ├── .env                         # Populated via deploy.sh
│   ├── models/
│   │   └── request.py               # Pydantic model for URL input
│   ├── services/
│   │   └── checker.py               # Logic for URL health checks
│   └── telemetry/
│       └── insights.py              # App Insights telemetry setup
├── bicep/
│   └── main.bicep                   # Deploys App Insights + Log Analytics
├── kql/
│   ├── queries.md                   # Overview of all KQL queries
│   ├── custom-events.kql            # Events like "URL Check Triggered"
│   ├── exceptions.kql               # All logged exceptions
│   ├── dependencies.kql             # HTTP dependency checks
│   ├── failures-last-hour.kql       # Summary of failures in last hour
│   ├── avg-duration-by-target.kql   # Average request duration by target
│   └── exceptions-over-time.kql     # Chart data for time-based errors
├── workbook/
│   ├── insights-monitoring-workbook.json  # Azure Monitor dashboard JSON
│   └── README.md                    # How to use the workbook
├── visuals/
│   ├── dashboard-preview.png        # Dashboard screenshot
│   ├── logs-sample.png              # Logs UI screenshot
│   └── kql-query-preview.png        # KQL result screenshot
├── deploy.sh                        # Deploys infra + exports connection strings
├── cleanup.sh                       # Deletes all deployed resources
├── .gitignore                       # Clean ignores for Python, VSCode, etc.
└── README.md                        # This file

---


## ⚙️ Deploy Infrastructure

```bash
./deploy.sh dev
```

This will:

- Deploy App Insights + Log Analytics
- Capture the connection string and instrumentation key
 -Write them into app/.env

---

## 🧪 Run App Locally

```bash
cd app/
pip install -r requirements.txt

# Run the app (uses .env)
uvicorn app.main:app --reload
```

Test it:

```bash
curl -X POST http://localhost:8000/check \
  -H "Content-Type: application/json" \
  -d '{"urls": ["https://azure.com", "https://microsoft.com"]}'
```

---

## 🌐 Optional: Deploy to Azure Web App

If deployWebApp=true in your Bicep deployment:

```bash
cd app/
zip -r app.zip *
az webapp deploy \
  --resource-group NickClarkRG \
  --name insightswebapp-dev-nick \
  --src-path app.zip \
  --type zip \
  --clean
```

Access your app at:

```bash
https://insightswebapp-dev-nick.azurewebsites.net/docs
```

---

## 📈 View Telemetry with KQL

See kql/queries.md for:
- Custom events
- Exceptions
- HTTP dependency checks
- Failures and durations

👉 Run these inside Azure Monitor → Logs → Application Insights

---

## 📊 Dashboard (Workbook)

To visualize logs and metrics in a reusable dashboard:

1. Go to Azure Monitor → Workbooks
2. Click + New → Advanced Editor
3. Paste workbook/insights-monitoring-workbook.json
4. Click Apply → Save As

---

## 📚 Docs & References

- [📘 Application Insights Overview](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)
- [📗 KQL Query Language Reference](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- [📙 Azure Monitor Workbooks](https://learn.microsoft.com/en-us/azure/azure-monitor/workbooks/workbooks-overview)

---

---

## 🙋‍♂️ Contact

If you found this project useful or want to connect over DevOps, monitoring, or certifications:

- 🧑‍💻 GitHub: [@NickTheDevOpsGuy](https://github.com/NickTheDevOpsGuy)
- 🔗 LinkedIn: [Nicholas A. Clark](https://www.linkedin.com/in/nicholas-a-clark/)
- ✉️ Email: nicholas.a.clark@outlook.com

---

## 🏷️ Hashtags / Tags

`#DevOps` `#Azure` `#ApplicationInsights` `#FastAPI` `#KQL`  
`#Observability` `#InfrastructureAsCode` `#AZ400` `#WorldDomination`

---

> *"World Domination isn’t just a goal — it’s a pipeline."*  
> — Nick