#!/bin/bash
sudo apt-get update && sudo apt-get -y upgrade

#Make
sudo apt-get -y install make

#Docker
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
docker -v

#Docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v

#Docker post-install
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

#Cleanup
sudo apt -y autoclean
sudo apt -y clean
sudo apt -y autoremove
sudo apt-get -f install 
sudo dpkg -l | awk '/^rc/ {print $2}' | xargs sudo dpkg --purge
sudo echo "vm.swappiness=5" >> /etc/sysctl.conf
