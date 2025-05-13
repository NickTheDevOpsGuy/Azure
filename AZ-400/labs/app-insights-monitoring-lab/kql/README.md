# 📊 KQL Queries for Website Health Monitor

These queries help you monitor your app’s telemetry in **Azure Monitor Logs** via Application Insights.

---

## 📌 1. All Custom Events (e.g. "URL Check Triggered")

```kql
customEvents
| where name == "URL Check Triggered"
| project timestamp, name, customDimensions
| order by timestamp desc
```

🛑 2. Exceptions (e.g. failed URL checks)

```kql
exceptions
| project timestamp, type, outerMessage, operation_Name
| order by timestamp desc
```

🧵 3. Dependencies (outgoing HTTP calls to URLs)

```kql
dependencies
| where type == "Http"
| project timestamp, target, resultCode, duration, success
| order by timestamp desc
```

🔁 4. Repeated Failures in Past 1 Hour

```kql
exceptions
| where timestamp > ago(1h)
| summarize count() by outerMessage
```

📈 5. Average Response Time per Target URL

```kql
dependencies
| where type == "Http"
| summarize avg(duration) by target
| order by avg_duration desc
```

🎯 6. Recent Requests Tracked by App Insights

```kql
requests
| where timestamp > ago(1h)
| project name, url, resultCode, duration, success
```

🚨 7. Alert-Worthy: Any 4xx/5xx Status Codes in Dependencies

```kql
dependencies
| where resultCode startswith "4" or resultCode startswith "5"
| project timestamp, target, resultCode, success
```

---

## 🧠 Pro Tip:

To visualize these:

- Go to **Application Insights > Logs**
- Paste a query, run it, and then:
  - 📌 **Pin it** to a shared dashboard
  - 📊 **Add it** to a Workbook