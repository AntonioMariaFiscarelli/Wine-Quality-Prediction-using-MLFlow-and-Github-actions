FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y iputils-ping && ping -c 4 deb.debian.org

RUN apt update -y && apt install awscli -y

WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]

