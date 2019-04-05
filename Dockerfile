FROM debian:jessie

RUN export CONTAINER_DIR ${pwd}
RUN export GRADLE_USER_HOME="${CONTAINER_DIR}/.gradle"

ENV PATH $GRADLE_USER_HOME:$PATH

RUN echo "deb http://ftp.debian.org/debian jessie main" >> /etc/apt/sources.list
#RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update
#RUN apt-get install openjdk-8-jdk -y
RUN apt-get install --target-release jessie openjdk-8-jre-headless ca-certificates-java -y
RUN npm install npm@6.4.1 -g

RUN bash -xc "\
pushd source-code; \
create-build.sh; \
popd; "

ADD source-code/wealth-management.tar.gz out/
RUN echo "0.0.1-SNAPSHOT" > out/version


