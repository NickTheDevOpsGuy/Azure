import httpx
import time
from app.telemetry.insights import logger

async def check_url(url):
    start = time.time()
    try:
        async with httpx.AsyncClient(timeout=5.0) as client:
            response = await client.get(url)
        duration = round(time.time() - start, 2)
        logger.info(f"Checked {url} - {response.status_code} in {duration}s")
        return {"url": url, "status_code": response.status_code, "duration": duration}
    except Exception as e:
        logger.error(f"Failed to check {url}: {str(e)}")
        return {"url": url, "error": str(e)}

async def check_urls(urls):
    from asyncio import gather
    return await gather(*[check_url(url) for url in urls])