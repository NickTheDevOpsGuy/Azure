# 📊 Application Insights Workbook

This folder contains a prebuilt Azure Monitor Workbook JSON for visualizing telemetry from the Website Health Monitor FastAPI app.

Use this workbook to visualize:

- 📈 **Average HTTP check durations**
- 🚨 **Failed HTTP checks (4xx/5xx)**
- 📋 **Custom events** like "URL Check Triggered"

---

## 📥 How to Import

1. Go to **Azure Portal → Monitor → Workbooks**
2. Click **+ New**, then **Advanced Editor**
3. Paste the contents of [`insights-monitoring-workbook.json`](./insights-monitoring-workbook.json)
4. Click **Apply**
5. Save the workbook with a name like `"FastAPI Monitoring Lab"`

---

## 🧪 Sample Visuals

- **Line chart** of average response times per URL
- **Table** of failing URLs and status codes
- **List** of recent custom events from telemetry

---

## 🧠 Tip: Customize Further

You can easily extend the workbook by adding:
- **Exceptions over time**
- **Live Metrics Stream tiles**
- **Parameter filters** for time ranges or URLs

Use this as a foundation and build up your own production-style observability dashboard!