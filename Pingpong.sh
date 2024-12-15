#!/bin/bash

# Ana kurulum fonksiyonu
install_pingpong() {
    # Çalışma dizinini root olarak ayarla
    cd /root/

    # PingPong dosyasını indir
    echo "PingPong dosyası indiriliyor..."
    wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG

    # Screen oturumu oluştur
    echo "Screen oturumu açılıyor..."
    screen -dmS pingpong

    # Screen içine komutu yaz ama çalıştırma
    screen -S pingpong -X stuff "chmod +x ./PINGPONG && ./PINGPONG --key"

    # Screen'i detach et
    screen -S pingpong -X detach

    # Screen'e tekrar bağlan
    screen -r pingpong

    # Script dosyasını sil
    rm /root/Pingpong.sh

    echo "Kurulum tamamlandı."
}

# Scripti çalıştır
install_pingpong
