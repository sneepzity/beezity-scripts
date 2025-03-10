#!/bin/bash

if [ "$(whoami)" = "root" ] 
then
        echo "Please run this script as non-root (./arch.sh)."
        exit
fi

clear

echo 'Install necessary gaming packages? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Install yay [an aur helper]? ( 1 for yes / 2 for already installed )'
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syyu
else
echo 'Continuing!'
fi
echo 'Adding Chaotic AUR..'
sudo pacman -Syyu
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
sudo pacman -Syu
sudo groupadd disk
sudo usermod -a -G disk $USER
sudo pacman -S reflector
echo 'Please forgive me if this takes a while...'
sleep 3
sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
yay -S gnu-unifont noto-fonts noto-fonts-cjk noto-fonts-emoji arch-gaming-meta dxvk-gplasync-bin-git ttf-ms-win11auto
echo 'Do you want to install HyDE? ( 1 for yes / 2 for no ) [https://github.com/Hyde-project/hyde]'
read input
if [ "$input" -eq 1 ]
then
sudo pacman -S --needed git base-devel
git clone --depth 1 https://github.com/HyDE-Project/HyDE ~/HyDE
cd ~/HyDE/Scripts
./install.sh
else
echo 'Continuing!'
fi
echo 'Done!'
exit
else
echo 'Exiting!'
fi

exit
