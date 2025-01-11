#!/bin/bash

# Script Error Handling
set -e

# Sunucu güncelleniyor
echo "Sunucu güncelleniyor..."
sudo apt update -y && sudo apt upgrade -y

# Gerekli bağımlılıklar yükleniyor
echo "Gerekli bağımlılıklar yükleniyor..."
sudo apt install -y curl apt-transport-https ca-certificates software-properties-common gnupg

# Docker kurulumu
# Mevcut Docker paketlerini kaldır
echo "Mevcut Docker paketleri kaldırılıyor..."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do 
    sudo apt-get remove -y $pkg
done

# Gerekli paketleri yükle
echo "Gerekli paketler yükleniyor..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Docker GPG anahtarını ayarla
echo "Docker GPG anahtarı ekleniyor..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Docker deposunu ekle
echo "Docker deposu ekleniyor..."
echo \
  "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  \"$({ source /etc/os-release && echo $VERSION_CODENAME; })\" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Paketleri tekrar güncelle
echo "Depolar güncelleniyor..."
sudo apt update -y && sudo apt upgrade -y

# Docker ve Docker Compose eklentisini yükle
echo "Docker ve Docker Compose kuruluyor..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Chromium için dizin oluştur ve docker-compose.yaml oluştur
echo "Chromium kurulumu yapılıyor..."
mkdir -p ~/chromium
cd ~/chromium

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
      - PASSWORD=123456 
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

# Chromium Container'ı başlat
echo "Chromium container başlatılıyor..."
docker compose up -d

# PingPong kurulumu
install_pingpong() {
    echo "PingPong kurulumu yapılıyor..."
    cd /root/

    # PingPong dosyasını indir
    wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG

    # Screen oturumu oluştur ve kaydet
    echo "Screen oturumu açılıyor..."
    screen -dmS pingpong

    # Screen detach
    screen -S pingpong -X detach
}

install_pingpong

# Network3 kurulumu
echo "Network3 kurulumu yapılıyor..."
cd ~

# WireGuard yükle
sudo apt install -y wireguard

# Network3 Node Arşivini indir
wget https://network3.io/ubuntu-node-v2.1.1.tar.gz

# Arşivi çıkart
echo "Arşiv çıkartılıyor..."
tar -xf ubuntu-node-v2.1.1.tar.gz

# Net Tools yükle
sudo apt-get install -y net-tools

# Çıkartılan dizine gir
cd ubuntu-node

# Node'u başlat
sudo bash manager.sh up

# Node için anahtar oluştur
sudo bash manager.sh key

# Geçici dosyaları temizle
cd ~
rm -f ~/ubuntu-node-v2.1.1.tar.gz

# Script dosyasını kaldır
rm -f ~/allinone.sh

echo "Kurulum tamamlandı!"
