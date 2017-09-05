FROM ubuntu:zesty
MAINTAINER Revilla
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common apt-utils
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
#RUN apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
RUN apt-get install -y unzip openjdk-8-jre-headless wget supervisor openssh-server
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
