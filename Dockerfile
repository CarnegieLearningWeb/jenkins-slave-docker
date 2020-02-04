FROM alpine:3.10.3

RUN echo "http://dl-2.alpinelinux.org/alpine/v3.10/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories 
RUN echo "http://dl-2.alpinelinux.org/alpine/v3.10/testing" >> /etc/apk/repositories 

RUN adduser -D jenkins

RUN apk --allow-untrusted --no-cache -U add \
    apache-ant \
    bash \
    curl \
    git \
    maven \
    nodejs \
    npm \
    openjdk8 \
    openssh-client \
    mysql-client \
    python3 \
    zlib-dev \
    chromium \
    xvfb \
    wait4ports \
    xorg-server \
    dbus \
    ttf-freefont \
    grep \
    udev \
    chromium-chromedriver
    
RUN pip3 install awscli

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/