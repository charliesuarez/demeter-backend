# Stage 1: Build the JAR file
FROM timescale/timescaledb:latest-pg16

WORKDIR /app

# Install system-level dependencies
RUN apk update && apk add --no-cache python3 py3-pip && rm -rf /var/cache/apk/*

# Create a virtual environment
RUN python3 -m venv ./.env
RUN source ./.env/bin/activate

# Copy source files
COPY requirements.txt main.py .

# Install project-level dependencies
RUN ./.env/bin/pip install --no-cache-dir -r requirements.txt

# Declare volume for persistent storage
VOLUME /var/lib/postgresql/data

# Run python script
RUN ./.env/bin/python3 ./main.py
