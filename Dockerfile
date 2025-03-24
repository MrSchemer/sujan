# Use official Python runtime as a base image
FROM python:3.11-slim

# Set working directory
WORKDIR /Sujan

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variables (adjust as needed)
ENV PYTHONUNBUFFERED=1

# Run Gunicorn (or another WSGI server)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "Sujan.wsgi:application"]