
FROM jenkins/jenkins:lts

LABEL MAINTAINER siriuszg <zhigang52110@sina.com>

USER root

COPY cmd/docker-install.sh /etc/jenkins/

RUN /etc/jenkins/docker-install.sh

COPY plugins.txt /etc/jenkins/

RUN /usr/local/bin/install-plugins.sh $(cat /etc/jenkins/plugins.txt | tr '\n' ' ')

RUN rm -rf /etc/jenkins
