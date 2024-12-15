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

    # Screen oturumu oluştur
    echo "Screen oturumu açılıyor..."
    screen -dmS pingpong bash

    # Screen içinde komutları çalıştır
    echo "PingPong çalıştırılıyor..."
    screen -S pingpong -X stuff "./PINGPONG --key^M"

    # Screen'i detach et
    screen -S pingpong -X detach

    echo "Kurulum tamamlandı. Screen oturumuna 'screen -r pingpong' komutuyla bağlanabilirsiniz."
}

# Scripti çalıştır
install_pingpong
