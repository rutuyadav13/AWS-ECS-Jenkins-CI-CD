#!/bin/bash
# Update OS & install dependencies
apt update -y
apt install -y openjdk-11-jdk git docker.io awscli

# Start Docker
systemctl enable docker
systemctl start docker

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update -y
apt install -y jenkins
systemctl enable jenkins
systemctl start jenkins

# Login to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOUR_AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
