#!/bin/bash

# Ana kurulum fonksiyonu
install_pingpong() {
    # Çalışma dizinini root olarak ayarla
    cd /root/

    # PingPong dosyasını indir
    echo "PingPong dosyası indiriliyor..."
    wget -O PINGPONG https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG

    # Dosyaya çalıştırma izni ver
    chmod +x ./PINGPONG

    # Screen oturumu oluştur ve doğrudan komutları çalıştır
    echo "Screen oturumu açılıyor ve PingPong başlatılıyor..."
    screen -dmS pingpong bash -c "chmod +x ./PINGPONG && ./PINGPONG --key"

    # Hemen screen'e bağlan
    screen -r pingpong

    # Script dosyasını sil
    rm /root/Pingpong.sh

    echo "Kurulum tamamlandı."
}

# Scripti çalıştır
install_pingpong
