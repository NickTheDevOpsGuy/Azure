from fastapi import FastAPI
from modules.api import create_app
from telemetry.insights import setup_telemetry

app: FastAPI = create_app()
setup_telemetry(app)

print("🔥 FastAPI app started and telemetry hooked.")