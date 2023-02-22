FROM python:3.10.10
MAINTAINER cf2dns
EXPOSE 80
USER root

RUN apt-get update && apt-get -y install \
    python3 python3-dev python3-dev python3-pip python3-venv 

ARG USER=root
USER $USER
RUN python3 -m venv venv
WORKDIR /app

RUN pip3 install -U pip setuptools
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt



RUN mkdir ./dns
COPY ./dns/__init__.py ./dns/
COPY ./dns/aliyun.py ./dns/
COPY ./dns/huawei.py ./dns/
COPY ./dns/qCloud.py ./dns/
COPY cf2dns.py ./
COPY log.py ./
COPY entrypoint.sh ./
