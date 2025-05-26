
from fastapi import APIRouter, Depends
from app.auth import get_current_active_user
from app.routers.patient import patient_router
from app.routers.queue import queue_router
from app.routers.service import service_router
from app.routers.user import user_router
from app.routers.doctor import doctor_router
from app.routers.upload import upload_router



ActiveUser = Depends(get_current_active_user)

routes = APIRouter(dependencies=[ActiveUser])


routes.include_router(patient_router)
routes.include_router(queue_router)
routes.include_router(service_router)
routes.include_router(user_router)
routes.include_router(doctor_router)  
routes.include_router(upload_router)  
