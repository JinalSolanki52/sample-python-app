FROM python:3.8-alpine

WORKDIR /app

# Copy and install dependencies FIRST (layer caching best practice)
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ /app/src/

# Run as non-root (good practice)
USER 1001

EXPOSE 5000

CMD ["python", "/app/src/app.py"]

