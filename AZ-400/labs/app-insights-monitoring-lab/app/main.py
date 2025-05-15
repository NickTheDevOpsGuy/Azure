from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

# Local modules (update these based on your actual structure)
from modules.routes import router as modules_router
from services.api import router as services_router
from telemetry.logging import configure_logging

app = FastAPI()

# Setup logging, monitoring, etc.
configure_logging()

# Expose Prometheus metrics
Instrumentator().instrument(app).expose(app)

# Register routers
app.include_router(modules_router)
app.include_router(services_router)