FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV DB_PATH=/app/db/ghg.db
RUN mkdir -p /app/db
EXPOSE 8000
# one worker: the SQLite file is seeded once at startup
CMD ["gunicorn", "-w", "1", "-b", "0.0.0.0:8000", "app:app"]
