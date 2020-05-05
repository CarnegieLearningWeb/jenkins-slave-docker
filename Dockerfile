FROM alpine:3.10.3

RUN echo "http://dl-2.alpinelinux.org/alpine/v3.10/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories 
RUN echo "http://dl-2.alpinelinux.org/alpine/v3.10/testing" >> /etc/apk/repositories 

RUN adduser -D jenkins
RUN addgroup jenkins ping

RUN apk --allow-untrusted --no-cache -U add \
    bash \
    curl \
    docker \
    git \
    maven \
    nodejs \
    npm \
    openjdk8 \
    openssh-client \
    mysql-client \
    py-pip \
    python2 \
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
    chromium-chromedriver \
    openldap-clients
    
RUN pip3 install awscli requests urllib3 pymysql
RUN pip install requests urllib3 pymysql

ENV ANT_VERSION 1.10.7
ENV ANT_HOME /etc/ant-${ANT_VERSION}

RUN cd /tmp \
    && wget http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mkdir ant-${ANT_VERSION} \
    && tar -zxvf apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mv apache-ant-${ANT_VERSION} ${ANT_HOME} \
    && rm apache-ant-${ANT_VERSION}-bin.tar.gz \
    && rm -rf ant-${ANT_VERSION} \
    && rm -rf ${ANT_HOME}/manual \
    && unset ANT_VERSION
ENV PATH ${PATH}:${ANT_HOME}/bin

ENV ANT_CONTRIB_VERSION 1.0b3

RUN cd /tmp \
    && wget https://sourceforge.net/projects/ant-contrib/files/ant-contrib/${ANT_CONTRIB_VERSION}/ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz \
    && tar -zxvf ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz \
    && cp ant-contrib/ant-contrib-${ANT_CONTRIB_VERSION}.jar ${ANT_HOME}/lib \
    && rm -rf ant-contrib \
    && rm ant-contrib-${ANT_CONTRIB_VERSION}-bin.tar.gz \
    && unset ANT_CONTRIB_VERSION

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/