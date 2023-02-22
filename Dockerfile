FROM python:3.10.10
MAINTAINER cf2dns
EXPOSE 80
USER root

RUN mkdir ./dns
COPY ./dns/__init__.py ./dns/
COPY ./dns/aliyun.py ./dns/
COPY ./dns/huawei.py ./dns/
COPY ./dns/qCloud.py ./dns/
COPY cf2dns.py ./
COPY log.py ./
COPY entrypoint.sh ./
