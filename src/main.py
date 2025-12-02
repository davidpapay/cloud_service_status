# Main FastAPI application for Cloud Service Status project
# Later there will be added service registration, health monitoring and status reporting.

from fastapi import FastAPI
app = FastAPI()

@app.get("/health")
def health_check():
    return {"status": "ok"}