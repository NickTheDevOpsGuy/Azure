from fastapi import FastAPI, HTTPException
from dotenv import load_dotenv
import os

# Load .env file for App Insights connection values
load_dotenv()

# Local imports
from models.request import URLCheckRequest
from services.checker import check_urls
from telemetry.insights import telemetry_client

app = FastAPI(title="Website Health Monitor with App Insights")

@app.post("/check")
async def check(request: URLCheckRequest):
    try:
        telemetry_client.track_event("URL Check Triggered", {"count": str(len(request.urls))})
        results = await check_urls(request.urls)
        telemetry_client.flush()
        return {"results": results}
    except Exception as e:
        telemetry_client.track_exception()
        telemetry_client.flush()
        raise HTTPException(status_code=500, detail="Failed to check URLs")