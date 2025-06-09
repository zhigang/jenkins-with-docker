
FROM jenkins/jenkins:lts

LABEL maintainer="siriuszg <zhigang52110@sina.com>"

USER root

# install docker
COPY cmd/docker-install.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-install.sh

RUN /usr/local/bin/docker-install.sh

RUN rm -rf /usr/local/bin/docker-install.sh

COPY env/plugins.txt /usr/share/jenkins/ref/
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt