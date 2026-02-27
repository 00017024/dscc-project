# ---------- Stage 1: Build ----------
FROM python:3.12-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libpq-dev

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --user -r requirements.txt


# ---------- Stage 2: Runtime ----------
FROM python:3.12-slim

WORKDIR /app

RUN adduser --disabled-password --no-create-home django

COPY --from=builder /root/.local /home/django/.local

ENV PATH=/home/django/.local/bin:$PATH

COPY . .

RUN chown -R django:django /app

USER django

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]