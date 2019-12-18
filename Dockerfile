
FROM jenkins/jenkins:2.209

LABEL MAINTAINER siriuszg <zhigang52110@sina.com>

USER root

# install docker
COPY cmd/docker-install.sh /usr/local/bin/

RUN /usr/local/bin/docker-install.sh

COPY env/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt