#!/bin/bash

# ubuntu-node dizinine geç
cd ~/ubuntu-node || { echo "~/ubuntu-node dizinine erişilemedi."; exit 1; }

# manager.sh scriptini down parametresiyle çalıştır
sudo bash manager.sh down

# Ana dizine dön
cd ~

# ubuntu-node dizinini sil
sudo rm -rf ubuntu-node

# ubuntu-node-v2.1.1.tar.gz dosyasını sil
sudo rm -rf ubuntu-node-v2.1.1.tar.gz

# WireGuard'ı kaldır
sudo apt remove --purge wireguard -y

# Gereksiz bağımlılıkları kaldır
sudo apt autoremove -y

# WireGuard yapılandırmalarını sil
sudo rm -rf /etc/wireguard

# Network3Delete.sh dosyasını sil
sudo rm -rf Network3Delete.sh

# İşlem tamamlandı mesajı
echo "Temizlik işlemleri başarıyla tamamlandı."
