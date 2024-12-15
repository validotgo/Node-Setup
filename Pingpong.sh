#!/bin/bash

# Hata durumunda scripti durdur
set -e

# Konsol için renkli çıktı
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Log fonksiyonu
log() {
    echo -e "${GREEN}[LOG]${NC} $1"
}

# Hata fonksiyonu
error() {
    echo -e "${RED}[HATA]${NC} $1"
    exit 1
}

# Ana kurulum fonksiyonu
install_pingpong() {
    # PingPong dosyasını indir
    log "PingPong dosyası indiriliyor..."
    wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG || error "İndirme başarısız oldu"

    # Screen oturumu oluştur
    log "Screen oturumu açılıyor..."
    screen -dmS pingpong

    # Screen içinde komutları çalıştır ve detach et
    log "PingPong çalıştırılıyor..."
    screen -S pingpong -X stuff "chmod +x ./PINGPONG && ./PINGPONG --key^M"
    screen -S pingpong -X detach

    # Screen'e geri dön
    log "Screen oturumuna geri dönülüyor..."
    screen -r pingpong
}
