# Stage 1: Builder 
FROM python:3.12-slim AS builder

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --user -r requirements.txt


# Stage 2: Runtime
FROM python:3.12-slim

WORKDIR /app

RUN adduser --disabled-password --no-create-home django

COPY --from=builder /root/.local /home/django/.local

ENV PATH=/home/django/.local/bin:$PATH

COPY . .

RUN mkdir -p /app/staticfiles && \
    chown -R django:django /app

USER django

CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]