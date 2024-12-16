#!/bin/bash

# Ubuntu 22 Server Setup Script

# Exit on any error
set -e
# Uyarıları devre dışı bırakmak için debconf ayarlarını yap
echo "debconf ayarları yapılıyor..."
export DEBIAN_FRONTEND=noninteractive
sudo apt install -y debconf-utils
echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections

# Sunucuyu güncelle
echo "Sunucu güncelleniyor..."
sudo apt update -y 
sudo apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew"

# Kernel güncellemesi durumunda uyarıyı bastır ve gerekirse yeniden başlat
if [ -f /var/run/reboot-required ]; then
  echo "Çekirdek yükseltmesi tespit edildi. Sistem yeniden başlatılıyor..."
  sudo reboot
fi

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
