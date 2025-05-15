from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

from modules.routes import router as modules_router
from telemetry.insights import configure_logging

app = FastAPI()

# 🔧 Configure App Insights logging
configure_logging()

# 📊 Prometheus instrumentation
Instrumentator().instrument(app).expose(app)

# 🛣️ Include routes from your modules folder
app.include_router(modules_router)

# 🏠 Basic root route
@app.get("/")
def read_root():
    return {"message": "App Insights + Metrics are working!"}