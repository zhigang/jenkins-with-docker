
FROM jenkins/jenkins:2.522

LABEL maintainer="siriuszg <zhigang52110@sina.com>"

USER root

# install docker
COPY cmd/docker-install.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-install.sh

RUN /usr/local/bin/docker-install.sh

RUN rm -rf /usr/local/bin/docker-install.sh

USER jenkins