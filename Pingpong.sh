#!/bin/bash

# Hata durumunda scripti durdur
set -e

# Gerekli araçların yüklü olup olmadığını kontrol et
command -v wget >/dev/null 2>&1 || { echo >&2 "wget gereklidir. Lütfen önce yükleyin."; exit 1; }
command -v screen >/dev/null 2>&1 || { echo >&2 "screen gereklidir. Lütfen önce yükleyin."; exit 1; }

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
    # Çalışma dizinini root olarak ayarla
    cd /root/

    # PingPong dosyasını indir
    log "PingPong dosyası indiriliyor..."
    wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG || error "İndirme başarısız oldu"

    # Dosyaya çalıştırma izni ver
    chmod +x ./PINGPONG

    # Screen oturumu oluştur
    log "Screen oturumu açılıyor..."
    screen -dmS pingpong bash

    # Screen içinde komutları çalıştır
    log "PingPong çalıştırılıyor..."
    screen -S pingpong -X stuff "./PINGPONG --key^M"

    # Screen'i detach et
    screen -S pingpong -X detach

    log "Kurulum tamamlandı. Screen oturumuna 'screen -r pingpong' komutuyla bağlanabilirsiniz."
}

# Scripti çalıştır
install_pingpong
