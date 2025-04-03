# Use an official Python runtime as a parent image
FROM public.ecr.aws/docker/library/python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Create a directory for the app
WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt /app/

# Install dependencies
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r requirements.txt

# Copy the application code
COPY . /app/

# Copy the model into the image (adjust the destination directory as needed)
COPY model/iris_model.joblib /app/model/iris_model.joblib

# Expose the port FastAPI will run on
EXPOSE 8002

# Command to run the application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8002"]
