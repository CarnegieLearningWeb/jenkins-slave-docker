FROM ubuntu:18.04

RUN adduser --disabled-password --gecos "" jenkins

RUN apt update && \
    apt -y install \
    git \
    maven \
    mysql-client-5.7
