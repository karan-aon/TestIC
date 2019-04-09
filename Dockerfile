FROM debian:stretch
FROM node:11.9.2

RUN export CONTAINER_DIR ${pwd}
RUN export GRADLE_USER_HOME="${CONTAINER_DIR}/.gradle"

ENV PATH $GRADLE_USER_HOME:$PATH

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get -q update && apt-get -y -q install --no-install-recommends -t stretch-backports openjdk-8-jdk
RUN npm install npm@6.4.1 -g


