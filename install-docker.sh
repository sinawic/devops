#!/bin/bash

# update apt and install pre reqs -->
# see https://docs.docker.com/engine/install/ubuntu/ for more details
echo "update apt and install pre reqs ======================================================================"
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# Add Docker’s official GPG key -->
echo "Add Docker official GPG key =========================================================================="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# set up the repository -->
echo "set up the repository ================================================================================"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine -->
echo "Install Docker Engine ================================================================================"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Install from a package -->
# sudo dpkg -i /path/to/package.deb -->

# install docker-compose -->
# see https://docs.docker.com/compose/install/compose-plugin/#installing-compose-on-linux-systems for more details
echo "install docker-compose ==============================================================================="
curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
