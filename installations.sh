#!/bin/bash
# Installing Jenkins
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Installing Git
sudo yum install git -y


#nodejs will be installed in the jenkins server

# Setup terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#install docker
sudo yum install docker docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker

sudo reboot