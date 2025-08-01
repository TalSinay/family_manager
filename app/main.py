from fastapi import FastAPI

app = FastAPI()
print("hello")
@app.get("/")
def home():
    return {"message": "hello Tal!!"}