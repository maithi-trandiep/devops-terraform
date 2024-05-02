#!/bin/bash

# Update package list
sudo apt-get update

# Install Git
sudo apt-get install -y git

# Install Docker
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add current user to the docker group
sudo usermod -aG docker $USER

# Clone an open-source project (replace <repository-url> with the actual project URL)
git clone https://github.com/docker/getting-started.git

# Change into the project directory (replace <project-directory> with the actual directory name)
cd s2i-nodejs-nginx-example

# Run the app
sudo docker run -d -p 80:80 docker/getting-started

# # Build and run the Docker container (assuming the project has a Dockerfile)
# sudo docker compose up -d

# Print the running containers
sudo docker ps