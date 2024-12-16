#!/bin/bash

# Ubuntu 22 Server Setup Script

# Exit on any error
set -e

# Sunucuyu güncelle
echo "Sunucu güncelleniyor..."
export DEBIAN_FRONTEND=noninteractive
sudo apt update -y && sudo apt upgrade -y --allow-downgrades --allow-remove-essential --allow-change-held-packages

# Gerekli bağımlılıkları yükle
echo "Gerekli bağımlılıklar yükleniyor..."
sudo apt install -y curl apt-transport-https ca-certificates software-properties-common

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh get-docker.sh 
sudo usermod -aG docker $USER 
sudo systemctl enable docker 
sudo systemctl start docker

# Prepare Chromium Docker setup
echo "Setting up Chromium Docker container..."
mkdir -p ~/chromium
cd ~/chromium

# Create docker-compose.yaml
cat << EOF > docker-compose.yaml
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    container_name: chromium
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - CUSTOM_USER=chrome
      - PASSWORD=123987Root
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - CHROME_CLI=
    volumes:
      - /root/chromium/config:/config
    ports:
      - 3010:3000 
      - 3011:3001
    shm_size: "1gb"
    restart: unless-stopped
EOF

# Start Chromium Docker container
docker compose up -d

# Remove unnecessary packages
echo "Removing unnecessary packages..."
sudo apt autoremove -y

# Remove the Docker installation script
echo "Cleaning up installation files..."
rm ~/New.sh

echo "Setup complete! Chromium Docker container is running and system is cleaned up."
