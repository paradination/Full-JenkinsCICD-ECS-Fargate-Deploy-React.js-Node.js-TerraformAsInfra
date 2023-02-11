#!/bin/bash
sudo apt-get update

# Installing Git
sudo apt install git -y

#install nodejs + npm node16
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

#install docker
sudo apt install docker.io -y
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl start docker
systemctl enable docker