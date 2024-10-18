#!/bin/bash

echo "Install yay, kitty, base-devel, network-manager, bluez-utils, brave browser, nautilus, flatpak, ncspot, adobe reader, space cadet pinball, vesktop, vlc, flatseal and sober? 
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
flatpak install -y --user --noninteractive io.github.hrkfdn.ncspot
flatpak install -y --user --noninteractive com.adobe.Reader
flatpak install -y --user --noninteractive com.github.k4zmu2a.spacecadetpinball
flatpak install -y --user --noninteractive dev.vencord.Vesktop
flatpak install -y --user --noninteractive org.videolan.VLC
flatpak install -y --user --noninteractive com.visualstudio.code
flatpak install -y --user --noninteractive com.github.tchx84.Flatseal
flatpak install -y --user --noninteractive us.zoom.Zoom
flatpak install -y --user --noninteractive https://sober.vinegarhq.org.sober.flatpakref
flatpak install -y --user --noninteractive io.github.flattool.Warehouse
mkdir ~/bin
echo 'PATH="/home/$USER/bin:$PATH"' >> ~/.zshrc
echo 'PATH="/home/$USER/bin:$PATH"' >> ~/.bashrc
cd bin
echo 'flatpak run io.github.hrkfdn.ncspot' >> ncspot
echo 'flatpak run com.adobe.Reader' >> adobe-reader
echo 'flatpak run com.github.k4zmu2a.spacecadetpinball' >> spacecadetpinball
echo 'flatpak run dev.Vencord.Vesktop' >> vesktop
echo 'flatpak run org.videolan.VLC' >> vlc
echo 'flatpak run com.visualstudio.code' >> vscode
echo 'flatpak run com.github.tchx84.Flatseal' >> flatseal
echo 'flatpak run us.zoom.Zoom' >> zoom
echo 'flatpak run org.vinegarhq.Sober' >> sober
echo 'flatpak run org.vinegarhq.Sober' >> roblox
echo 'flatpak run io.github.flattool.Warehouse' >> warehouse
chmod +x ncspot
chmod +x adobe-reader
chmod +x spacecadetpinball
chmod +x vesktop
chmod +x vlc
chmod +x vscode
chmod +x flatseal
chmod +x zoom
chmod +x sober
chmod +x roblox
chmod +x warehouse
else
echo "Thanks for looking at my scripts!"
fi

exit
