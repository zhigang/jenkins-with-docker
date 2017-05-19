
FROM jenkins:2.46.2

USER root

# install docker
COPY cmd/docker-engine-install.sh /usr/local/bin/

RUN /usr/local/bin/docker-engine-install.sh

# install etc
RUN apt-get update && apt-get install -y libsystemd-journal0 jq

COPY env/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt