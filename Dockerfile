FROM openjdk:11
MAINTAINER Xander Smeets <xander@smeets.re>

ARG DEBIAN_FRONTEND=noninteractive

ADD 01-nodoc.conf /etc/dpkg/dpkg.cfg.d/01-nodoc

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get remove -y --purge libzmq-dev python-dev libc-dev \
 && apt-get remove -y --purge gcc cpp binutils \
 && apt-get -y install \
        software-properties-common \
 && apt-get -y install \
        ant \
        ant-optional \
        junit4 \
        libhamcrest-java \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]
WORKDIR /data
