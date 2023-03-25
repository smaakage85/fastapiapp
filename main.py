import os

from fastapi import FastAPI
from pydantic import BaseModel


class Item(BaseModel):
    x: float

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "IT'S ALIVE!"}

@app.post("/square/")
async def create_item(item: Item):
    result = item.x ** 2
    return({"result":result})

@app.get("/env/")
async def test_env():
    result=os.environ["env_var"]
    return {"message":result}
