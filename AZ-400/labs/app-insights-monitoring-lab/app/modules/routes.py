from fastapi import APIRouter

router = APIRouter()

@router.get("/hello")
def hello_world():
    return {"message": "Hello from modules.routes!"}

@router.get("/fail")
def trigger_error():
    raise ValueError("💥 Intentional error for alert testing")