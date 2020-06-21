FROM debian:buster
RUN adduser --disabled-password --gecos "" builder
RUN apt-get -qq update
RUN apt-get -qq install build-essential file wget cpio python python3 unzip rsync bc git
USER builder
