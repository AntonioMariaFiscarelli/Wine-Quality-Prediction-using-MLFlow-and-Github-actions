# Stage 1: Build with full tools
FROM python:3.8-buster as builder

RUN apt-get update && \
    apt-get install -y curl unzip && \
    pip install awscli

# Stage 2: Copy only what’s needed
FROM python:3.8-slim-buster

COPY --from=builder /usr/local/bin/aws /usr/local/bin/aws
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages

WORKDIR /app