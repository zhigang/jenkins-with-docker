#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

echo -e "\n 1.Install packages to allow apt to use a repository over HTTPS:"

apt-get update &> /dev/null

apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

echo -e "\n 2.Add Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

echo -e "\n 3.Use the following command to set up the stable repository. You always need the stable repository, even if you want to install edge builds as well."
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

echo -e "\n 4.Install CS Docker Engine:"
apt-get update &> /dev/null

echo -e "\n Execute install docker"
apt-get install docker-ce

echo -e "\n Execute install docker-compose"
curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo -e "\n Show docker and docker-compose version: "
docker -v
docker-compose -v

exit 0;