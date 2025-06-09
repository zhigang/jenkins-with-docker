#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

# Add Docker's official GPG key:
apt-get update &>/dev/null
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
   sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update

echo -e "\n 4.Install CS Docker Engine:"
apt-get update &>/dev/null

echo -e "\n Execute install docker"
apt-get install -y docker-ce-cli

echo -e "\n Show docker and docker-compose version: "
docker -v
docker compose version

exit 0
