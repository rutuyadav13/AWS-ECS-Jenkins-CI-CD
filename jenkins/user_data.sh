#!/bin/bash

# Update packages
sudo apt update -y

# Install Java
sudo apt install -y fontconfig openjdk-17-jdk

# Install required packages
sudo apt install -y curl gnupg lsb-release

# Add Jenkins key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
| sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
| sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update again
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins


# -----------------------
# Install Docker
# -----------------------

sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu


# -----------------------
# Install AWS CLI
# -----------------------

sudo apt install -y awscli


# -----------------------
# Install Git
# -----------------------

sudo apt install -y git

# Login to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOUR_AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
