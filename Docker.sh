#!/bin/bash

# Sunucuyu güncelle
echo "Sunucu güncelleniyor..."
sudo apt update -y && sudo apt upgrade -y

# Gerekli bağımlılıkları yükle
echo "Gerekli bağımlılıklar yükleniyor..."
sudo apt install -y curl apt-transport-https ca-certificates software-properties-common

# Docker'ı yükle
echo "Docker kuruluyor..."
curl -fsSL https://get.docker.com | sudo bash

# Docker'ı başlat ve otomatik başlatmayı etkinleştir
echo "Docker başlatılıyor ve otomatik başlatma etkinleştiriliyor..."
sudo systemctl start docker
sudo systemctl enable docker

# Kurulumun tamamlandığını bildir
echo "Docker kurulumu tamamlandı. Docker versiyonu:"
docker --version
