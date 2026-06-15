# Base Profile: Production optimized runtime baseline
FROM python:3.9-slim

# Identity: Assignment authorship track and metadata configurations
LABEL maintainer="Rana Tashfeen Fazal" \
      version="1.0.0" \
      description="Production optimized runtime image for Sakila Flask App Service"

# Workspace: Set internal secure application operating directory
WORKDIR /app

# Cache Layer optimization: Copy requirements first to leverage Docker layer caching
COPY requirements.txt .

# Execution: Pull dependencies and flush installation caches
RUN pip install --no-cache-dir -r requirements.txt

# Sync: Port remaining repository source code layers over
COPY . .

# Isolation: Enforce least privilege by running under an unprivileged user space
RUN adduser --disabled-password --gecos "" flaskuser && \
    chown -R flaskuser:flaskuser /app
USER flaskuser

# Parameters: Fallback app configuration environment state
ENV FLASK_ENV=production

# Interface: Limit perimeter exposure exclusively to application runtime traffic
EXPOSE 5000

# Resilience: Container runtime health check evaluation rules
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:5000/health || exit 1

# Payload: Entrypoint execution script invocation
CMD ["python", "app.py"]
