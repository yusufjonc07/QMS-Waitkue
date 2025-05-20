from .user import * 
from sqlalchemy.orm import backref

from datetime import datetime 
from sqlalchemy import Column, Date, ForeignKey, Integer, Numeric, String, DateTime, Time, Text, Boolean 
from sqlalchemy.orm import relationship 
from ..db import Base 
 
now_sanavaqt = datetime.now() 


class Patient(Base):
    __tablename__ = "patient"
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String, default='')
    surename = Column(String, default='')
    fathername = Column(String, default='')
    gender = Column(String, default='unknown')
    age = Column(Date)
    address = Column(String, default='')
    phone = Column(Integer,  unique=True)
    created_at = Column(DateTime, default=now_sanavaqt)
    updated_at = Column(DateTime, default=now_sanavaqt)
    user_id = Column(Integer, ForeignKey('user.id'), default=0)

    user = relationship('User', backref='patients')       
    