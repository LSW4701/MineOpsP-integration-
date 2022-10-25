#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y gnupg
sudo apt-get install -y lsb-release
sudo apt-get install -y net-tools
sudo apt-get install -y bind-utils
sudo apt-get install -y vim
sudo apt-get install -y openssh-server
sudo apt-get install -y git
sudo apt-get install -y unzip
sudo apt-get install -y make
sudo apt-get install -y make-guile 

sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker ubuntu # 도커설치 

sudo apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker ubuntu # 도커설치 


# source
cd /home/ubuntu
git clone https://github.com/dev-chulbuji/devops_06_03_jenkins.git
chown -R ubuntu:ubuntu devops_06_03_jenkins
cd /home/ubuntu/devops_06_03_jenkins/src/jenkins_remote_docker
make run