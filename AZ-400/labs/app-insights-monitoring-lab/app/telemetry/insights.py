from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace.samplers import ProbabilitySampler
from opencensus.trace.tracer import Tracer
from opencensus.ext.azure.log_exporter import AzureLogHandler
import logging
import os

INSTRUMENTATION_KEY = os.getenv("APPINSIGHTS_INSTRUMENTATIONKEY")

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING")))
logger.setLevel(logging.INFO)

telemetry_client = Tracer(
    exporter=AzureExporter(connection_string=os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING")),
    sampler=ProbabilitySampler(1.0)
)