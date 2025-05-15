from fastapi import APIRouter

router = APIRouter()

@router.get("/hello")
def hello_world():
    return {"message": "Hello from modules.routes!"}