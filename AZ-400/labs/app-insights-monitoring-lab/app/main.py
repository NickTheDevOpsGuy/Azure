from fastapi import FastAPI
from telemetry.insights import setup_telemetry
from modules.api import create_app

# Setup telemetry (e.g. Application Insights logging)
setup_telemetry()

# Create FastAPI app with all modules and routes registered
app: FastAPI = create_app()