#!/bin/bash

# Ana kurulum fonksiyonu
install_pingpong() {
    # Çalışma dizinini root olarak ayarla
    cd /root/

    # PingPong dosyasını indir
    echo "PingPong dosyası indiriliyor..."
    wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG

    # Screen oturumu oluştur ve kaydedip çık
    echo "Screen oturumu açılıyor..."
    screen -dmS pingpong

    # Screen'i detach et
    screen -S pingpong -X detach

    # Screen'e tekrar bağlan
    screen -r pingpong
}

# Scripti çalıştır
install_pingpong
