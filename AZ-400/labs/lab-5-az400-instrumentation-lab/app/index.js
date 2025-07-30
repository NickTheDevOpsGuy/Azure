// Load environment variables
require("dotenv").config({ path: require("path").resolve(__dirname, ".env") });

// ✅ Initialize Application Insights before anything else
const appInsights = require("applicationinsights");
const connStr = process.env.APPLICATIONINSIGHTS_CONNECTION_STRING;

if (!connStr) {
  console.error("❌ APPLICATIONINSIGHTS_CONNECTION_STRING is not set.");
  process.exit(1);
}

console.log("✅ Env Loaded: APPLICATIONINSIGHTS_CONNECTION_STRING is set");

appInsights
  .setup(connStr)
  .setAutoCollectRequests(true)
  .setAutoCollectPerformance(true)
  .setAutoCollectExceptions(true)
  .setAutoCollectDependencies(true)
  .setAutoCollectConsole(true, true)
  .setUseDiskRetryCaching(true)
  .setInternalLogging(false, true)
  .start();

const client = appInsights.defaultClient;

// 🔧 Express Setup
const express = require("express");
const os = require("os");
const path = require("path");

const app = express();
const port = process.env.PORT || 8080;

// Serve static files
app.use(express.static(path.join(__dirname, "public")));

// Routes
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

// Start Server
app.listen(port, () => {
  console.log(`🚀 App running on http://localhost:${port}`);
});
