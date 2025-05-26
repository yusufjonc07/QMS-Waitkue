    
from typing import Optional
from fastapi import UploadFile
from pydantic import BaseModel
from datetime import time

class NewSpecialist(BaseModel):
    service: str
    description: str
    available_days: list[str]
    room: int
    from_time: time
    to_time: time
    user_id: int
    image_url: str
       
    