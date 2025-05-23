require("dotenv").config();
const express = require("express");
const appInsights = require("applicationinsights");
const os = require("os");
const path = require("path");

const app = express();
const port = process.env.PORT || 3000;

const connStr = process.env.APPLICATIONINSIGHTS_CONNECTION_STRING;
if (!connStr) {
  console.error("❌ APPLICATIONINSIGHTS_CONNECTION_STRING is not set.");
  process.exit(1);
}

appInsights.setup(connStr);

appInsights.start({
  connectionString: connStr,
});

const client = appInsights.defaultClient;

app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
  client.trackEvent({ name: "HomePageVisited" });
  res.sendFile(path.join(__dirname, "views/index.html"));
});

app.get("/health", (req, res) => {
  client.trackMetric({ name: "HealthCheck", value: 1 });
  res.json({
    status: "ok",
    uptime: process.uptime(),
    version: "1.0.0",
    hostname: os.hostname(),
  });
});

app.get("/simulate-error", (req, res) => {
  try {
    throw new Error("💥 Simulated server error");
  } catch (error) {
    client.trackException({ exception: error });
    res.status(500).send("Simulated error logged.");
  }
});

app.get("/custom-metric", (req, res) => {
  const latency = Math.random() * 1000;
  client.trackMetric({ name: "CustomLatency", value: latency });
  res.send(`📊 Custom latency metric sent: ${latency.toFixed(2)}ms`);
});

app.listen(port, () => {
  console.log(`🚀 App running at http://localhost:${port}`);
});