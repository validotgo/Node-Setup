#!/bin/bash

# Renk tanımlamaları
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Banner gösterimi
echo -e "${GREEN}=== Sistem Güncelleme Scripti ===${NC}"
echo "Ubuntu 22.04 için güncelleme işlemi başlatılıyor..."

# Güncelleme komutlarını çalıştır
echo -e "${GREEN}Paket listesi güncelleniyor...${NC}"
sudo apt update -y

echo -e "${GREEN}Sistem güncellemeleri yükleniyor...${NC}"
sudo apt upgrade -y

# Script'in kendisini silme işlemi
echo -e "${GREEN}Temizlik yapılıyor...${NC}"
rm -- "$0"

# Sistem yeniden başlatma
echo -e "${GREEN}Sistem yeniden başlatılıyor...${NC}"
sudo reboot
