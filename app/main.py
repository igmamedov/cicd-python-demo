from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {"message": "Hello from CI/CD"}


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/version")
def version():
    return {"version": "1.0.0"}

@app.get("/info")
def info():
    return {
        "text": "llm available"
    }