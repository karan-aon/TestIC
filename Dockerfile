FROM debian:stretch
FROM node:11.9.0

RUN export CONTAINER_DIR ${pwd}
RUN export GRADLE_USER_HOME="${CONTAINER_DIR}/.gradle"

ENV PATH $GRADLE_USER_HOME:$PATH

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get -q update && apt-get -y -q install --no-install-recommends -t stretch-backports openjdk-8-jdk

#RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
#RUN apt-get update
#RUN apt-get install -t stretch-backports openjdk-8-jdk -y
RUN npm install npm@6.4.1 -g

WORKDIR source-code

RUN bash -xc "\
pushd source-code; \
create-build.sh; \
popd; "

ADD source-code/wealth-management.tar.gz out/
RUN echo "0.0.1-SNAPSHOT" > out/version


