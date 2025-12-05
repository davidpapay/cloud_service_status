# Base image with Python runtime
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Copy dependency definitions
COPY src/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY src .

# Command that starts the FastAPI app using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]