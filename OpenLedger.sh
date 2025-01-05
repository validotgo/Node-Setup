
#!/bin/bash
    slm=$(echo "\033[31;3m")
    normal=$(echo "\033[m")
    menu=$(echo "\033[36m") 
    number=$(echo "\033[33m") 
    bgred=$(echo "\033[39;3m")
    fgred=$(echo "\033[32;3m")
    kbred=$(echo "\033[33;3m")
    printf "\n${kbred}-----> Kurulum başlıyor${normal}\n"

# Root şifresini değiştir
echo "root:123987Ve" | sudo chpasswd

# Sistem güncellemesi
sudo apt update

# Gerekli paketlerin kurulumu
sudo apt install -y libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libsecret-1-0
sudo apt-get install -y libgbm1
sudo apt-get install -y libasound2
sudo apt install -y unzip

# XRDP Kurulumu
sudo apt -y install xrdp
sudo adduser xrdp ssl-cert
sudo ufw allow 3389
sudo systemctl restart xrdp

# Masaüstü ortamı kurulumu
dsrt=$(hostnamectl | egrep "Operating System" | cut -f2 -d":" | cut -f2 -d " ")
system3=$(hostnamectl | egrep "Operating System" | cut -f2 -d":" | cut -f2-4 -d " ")

if [[ $system3 = "Debian GNU/Linux 9" ]] ; then
    sudo apt -y install task-lxqt-desktop
else
    if [[ $dsrt = "Debian" ]] ; then
        sudo apt-get -y install task-gnome-desktop
    elif [[ $dsrt = "Ubuntu" ]] ; then
        sudo apt -y install xfce4
        echo xfce4-session >~/.xsession 
        sudo service xrdp restart
    fi
fi

# Masaüstü kurulumundan sonra oluşan klasörleri sil
printf "\n${kbred}-----> Gereksiz klasörler siliniyor${normal}\n"
sleep 10  # Klasörlerin oluşması için 10 saniye bekle
rm -rf ~/Documents
rm -rf ~/Downloads
rm -rf ~/Music
rm -rf ~/Templates
rm -rf ~/Pictures
rm -rf ~/Videos
rm -rf ~/Public

# OpenLedger kurulumu
wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip
unzip openledger-node-1.0.0-linux.zip
sudo dpkg -i openledger-node-1.0.0.deb

# Bağımlılık sorunlarını çöz
sudo apt-get install -f

# Son temizlik işlemleri
printf "\n${kbred}-----> Kurulum dosyaları temizleniyor${normal}\n"
rm -f OpenLedger.sh
rm -f openledger-node-1.0.0-linux.zip

clear && printf '\e[3J'
echo ""
echo "############################################"
ip_add=$(wget -qO- ifconfig.me)
echo -e "\033[31;4m##  İp Adresiniz: $ip_add\033[0m"
echo "############################################"
echo ""

printf "\n${slm}-----> Kurulum Tamamlandı....${normal}\n"
