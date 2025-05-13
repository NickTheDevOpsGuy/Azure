from pydantic import BaseModel, HttpUrl
from typing import List

class URLCheckRequest(BaseModel):
    urls: List[HttpUrl]