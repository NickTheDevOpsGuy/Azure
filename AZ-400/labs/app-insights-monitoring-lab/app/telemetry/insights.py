import logging
import os

def setup_telemetry():
    logging.basicConfig(level=logging.INFO)
    logger = logging.getLogger(__name__)

    conn = os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING")
    if conn:
        logger.info("App Insights connection string detected.")