#!/bin/bash

echo "Install yay, kitty, base-devel, network-manager, bluez-utils, brave browser, nautilus, flatpak? 
( 1 for install / 2 for no )"
read input
if [ "$input" -eq 1 ]
then
sudo pacman -S --noconfirm --needed kitty base-devel networkmanager bluez-utils
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now bluetooth
git clone https://aur.archlinux.org/yay.git ~/yay
cd yay
makepkg -si
sleep 3
echo 'Yet another yogurt has been installed!'
yay -S brave-bin nautilus flatpak
# Work in progress for now
