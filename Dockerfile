FROM python:3.8-slim-buster

# Set noninteractive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        gcc \
        libffi-dev \
        libssl-dev \
        python3-dev && \
    pip install awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt
CMD ["python3", "app.py"]