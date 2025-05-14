import logging
import os
from fastapi import FastAPI
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace.samplers import ProbabilitySampler
from opencensus.ext.fastapi.middleware import FastAPITraceMiddleware

def setup_telemetry(app: FastAPI):
    conn_str = os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING")
    
    if not conn_str:
        print("⚠️ App Insights connection string not found. Skipping telemetry setup.")
        return

    # Trace requests
    FastAPITraceMiddleware(app, exporter=AzureExporter(connection_string=conn_str), sampler=ProbabilitySampler(1.0))

    # Log to App Insights
    logger = logging.getLogger("appinsights")
    logger.setLevel(logging.INFO)
    logger.addHandler(AzureLogHandler(connection_string=conn_str))
    logger.info("🚀 Telemetry successfully connected to Azure Monitor.")