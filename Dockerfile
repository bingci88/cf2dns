FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    python3 python3-dev python3-dev python3-pip python3-venv 

ARG USER=root
USER $USER
RUN python3 -m venv venv
WORKDIR /app

RUN pip3 install -U pip setuptools
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
COPY start.sh start.sh
COPY . .

EXPOSE 80
RUN chmod +x /app/start.sh
ENTRYPOINT ["./start.sh"]
