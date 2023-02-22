FROM python:3.10.10
MAINTAINER cf2dns
EXPOSE 80
USER root

COPY cf2dns.py ./
COPY log.py ./
COPY entrypoint.sh ./
