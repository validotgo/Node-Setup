#!/bin/bash

# Program URL'si
PROGRAM_URL="https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG"

# Programı indirme
wget $PROGRAM_URL -O PINGPONG

# Screen başlatma
screen -dmS pingpong

# Screen içerisine komutları gönderme
screen -S pingpong -X stuff "chmod +x ./PINGPONG && ./PINGPONG --key"
screen -S pingpong -X stuff "\n"

# Kullanıcıya bilgi verme
echo "Script çalıştırıldı. Screen içinde 'chmod +x ./PINGPONG && ./PINGPONG --key' komutu yazıldı ve bekliyor."

# Screen'e bağlanma
screen -r pingpong
