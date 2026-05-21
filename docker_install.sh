#!/bin/bash

echo "System Update ..."
sudo apt update && sudo apt upgrade -y

echo "Necessary File Installed"
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updates Again"
sudo apt update

echo "Docker Installation Starts..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Installation Verifications... Docker and Docker Compose"
docker --version

docker compose --version

echo "Docker Service Starts"
sudo systemctl enable docker

sudo systemctl start docker

echo "User added to Group"
sudo usermod -aG docker $USER

echo "Setup Complete and Now the Work"

sleep 3

echo "Install NPM and nodejs"

sudo apt install npm nodejs

echo "Installation Done"
