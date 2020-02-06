FROM ubuntu:18.04

RUN adduser --disabled-password --gecos "" jenkins \
    && apt update \
    && apt -y install \
       curl \
       git \
       maven \
       mysql-client-5.7 \
       openjdk-8-jdk \
    && update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
