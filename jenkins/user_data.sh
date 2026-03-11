#!/bin/bash
# Install Java (required for Jenkins)
apt update -y
apt install openjdk-11-jdk -y

# Add Jenkins repo and install
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update -y
apt install jenkins -y

# Start Jenkins
systemctl start jenkins
systemctl enable jenkins