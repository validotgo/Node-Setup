#!/bin/bash

# Script Error Handling
set -e

# Update and Upgrade Packages
sudo apt update -y && sudo apt upgrade -y

# Remove Existing Docker Packages
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do 
    sudo apt-get remove -y $pkg
done

# Install Required Packages
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Setup Docker GPG Key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker Repository
echo \
  "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  \"$({ source /etc/os-release && echo $VERSION_CODENAME; })\" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and Upgrade Packages Again
sudo apt update -y && sudo apt upgrade -y

# Install Docker and Docker Compose Plugin
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create and Navigate to Chromium Directory
mkdir -p ~/chromium
cd ~/chromium

# Create docker-compose.yaml File
cat <<EOF > docker-compose.yaml
---
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
      - TZ=Etc/UTC
      - CHROME_CLI=
    volumes:
      - /root/chromium/config:/config
    ports:
      - 3010:3000  
      - 3011:3001   
    shm_size: "1gb"
    restart: unless-stopped
EOF

# Start Chromium Container
docker compose up -d

# Completion Message
echo "Setup completed successfully. Chromium container is running."
