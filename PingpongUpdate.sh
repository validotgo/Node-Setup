#!/bin/bash

# Önceki program dosyasını sil
sudo rm -f PINGPONG

# Programı yeniden indir
wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG -O PINGPONG

# Screen oturumuna bağlan
screen -r pingpong -X stuff $'\u001b[A\n' # Yukarı yön tuşu ve Enter

# Screen'den kaydederek çık (detach)
screen -d pingpong

# 2-3 saniye bekle
sleep 4

# Ana ekranda belirtilen komutları çalıştır
./PINGPONG stop --depins=hemi && \
./PINGPONG stop --depins=soneium && \
./PINGPONG stop --depins=filecoin-station && \
./PINGPONG stop --depins=dawn && \
./PINGPONG stop --depins=nesa && \
./PINGPONG stop --depins=aioz && \
./PINGPONG stop --depins=grass && \
./PINGPONG stop --depins=0g && \
./PINGPONG stop --depins=blockmesh && \
./PINGPONG stop --depins=gradient && \
./PINGPONG stop --depins=teneo && \
./PINGPONG stop --depins=witness

# İşlem tamamlandı mesajı
echo "Script başarıyla tamamlandı."
