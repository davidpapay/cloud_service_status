# Main FastAPI application for Cloud Service Status project
# Later there will be added service registration, health monitoring and status reporting.

from fastapi import FastAPI
import os

app = FastAPI()

# Application version from environment variable or default to 'dev'
APP_VERSION = os.getenv("APP_VERSION", "dev")

# Health check endpoint
@app.get("/health")
def health_check():
    return {"status": "ok"}

# Readiness check endpoint
@app.get("/ready")
def readiness():
    return {"status": "ready"}

# Version endpoint
@app.get("/version")
def version():
    return {
        "version": APP_VERSION
    }