#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

echo -e "\n Install on Ubuntu 14.04 LTS or 16.04 LTS by 2017-3-23"

echo -e "\n 1.Install packages to allow apt to use a repository over HTTPS:"

apt-get update &> /dev/null

apt-get install -y --no-install-recommends \
    apt-transport-https \
    curl \
    software-properties-common

#echo -e "\n Optionally, install additional kernel modules to add AUFS support."
#apt-get install -y --no-install-recommends \
#    linux-image-extra-$(uname -r) \
#    linux-image-extra-virtual

echo -e "\n 2.Download and import Docker’s public key for CS packages:"
curl -fsSL 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e' |
apt-key add -

echo -e "\n 3.Add the repository. In the command below, the lsb_release -cs sub-command returns the name of your Ubuntu version, like xenial or trusty."
add-apt-repository \
   "deb https://packages.docker.com/1.13/apt/repo/ \
   ubuntu-$(lsb_release -cs) \
   main"

echo -e "\n 4.Install CS Docker Engine:"
apt-get update &> /dev/null

echo -e "\n Execute install docker"
apt-get install -y docker-engine

echo -e "\n Execute install docker-compose"
curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo -e "\n Show docker and docker-compose version: "
docker -v
docker-compose -v

exit 0;