#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

echo "1. Install packages to allow apt to use a repository over HTTPS:"

apt-get update &> /dev/null

apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

echo "2. Add Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

echo "3. Use the following command to set up the stable repository. You always need the stable repository, even if you want to install edge builds as well."
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

echo "4. Install CS Docker Engine:"
apt-get update &> /dev/null
apt-get install -y docker-ce-cli

exit 0;