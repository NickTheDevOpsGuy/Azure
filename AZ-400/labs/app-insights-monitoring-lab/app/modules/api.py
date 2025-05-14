from fastapi import FastAPI
from services.metrics_service import get_metrics

def create_app() -> FastAPI:
    app = FastAPI(title="Modular App Insights Lab")

    @app.get("/")
    def root():
        return {"message": "Hello from Modular FastAPI!"}

    @app.get("/metrics")
    def metrics():
        return get_metrics()

    return app