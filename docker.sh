#!/bin/bash

# Update the package manager and install Docker
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo usermod -aG docker $USER && newgrp docker
sudo chmod 777 /var/run/docker.sock
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
# Start the Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Pull and run a simple Nginx web server container
sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
sudo docker run -d --name jenkins -p 8080:8080 jenkins/jenkins:latest
