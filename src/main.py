from fastapi import FastAPI, Request

app = FastAPI()

@app.middleware("http")
async def log_request_response(request: Request, call_next):
    print(f"{request.method} {request.client.host}:{request.url.port} {request.url.path}")
    print(f"Request Headers: {request.headers}")
    response = await call_next(request)
    print(f"Response Headers: {response.headers}")
    return response

@app.get("/")
async def hello():
    return {"Hello": "World!"}
