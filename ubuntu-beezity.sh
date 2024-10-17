#!/bin/bash

echo 'This script is for Ubuntu 22.04 (MINIMAL) ONLY.
I DO NOT GUARANTEE COMPATIBILITY WITH ALL OTHER VERSIONS EXCEPT 22.04 MINIMAL.
Make sure to read all scripts you download before executing them, especially ones running as root.'

echo 'This script is meant to be run after ubuntu.sh, make sure you have run it before hand.'

echo 'Do you want to install Playonlinux? (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
sudo apt install playonlinux

echo 'Do you want to install VS Code, ncspot, Adobe Reader, Space Cadet Pinball, Vesktop, VLC, Flatseal, Sober and Gnome extension-manager? (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
echo 'Nothing much will seem to be happening, please give it time especially if your internet is slow'
flatpak install -y --user --noninteractive io.github.hrkfdn.ncspot
flatpak install -y --user --noninteractive com.adobe.Reader
flatpak install -y --user --noninteractive com.github.k4zmu2a.spacecadetpinball
flatpak install -y --user --noninteractive dev.vencord.Vesktop
flatpak install -y --user --noninteractive org.videolan.VLC
flatpak install -y --user --noninteractive com.visualstudio.code
flatpak install -y --user --noninteractive com.github.tchx84.Flatseal
flatpak install -y --user --noninteractive us.zoom.Zoom
flatpak install -y --user --noninteractive com.mattjakeman.ExtensionManager
flatpak install -y --user --noninteractive https://sober.vinegarhq.org.sober.flatpakref
else
echo 'Thanks for looking at my scripts!'
fi

echo 'Make terminal shortcuts (can launch from terminal) for flatpak apps? (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
# This creates a folder for the terminal apps specifically and adds it to PATH in both zsh and bash
cd
mkdir ~/bin
echo 'PATH="/home/$USER/bin:$PATH"' >> ~/.zshrc
echo 'PATH="/home/$USER/bin:$PATH"' >> ~/.bashrc
cd bin
# These are the apps themselves, the output is directed towards a file and the output is the command to run flatpak apps
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
echo 'flatpak run com.mattjakeman.ExtensionManager' >> extension-manager
# chmod +x makes them executables instead of just plain text files
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
chmod +x extension-manager
cd
echo 'Make sure to check the commands inside the bin folder using a terminal text-editor like vim or nano as they might be wrong and also subject to change which both can cause breakage!'
else
echo "Thanks for looking at my scripts!"
fi

echo 'Set Gnome to dark mode, performance mode, 12 hour idle and clock format, no idle dimming, no mouse acceleration, do not disturb and install gnome-tweaks (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
gsettings set org.gnome.desktop.interface clock-format '12h'
powerprofilesctl set performance
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.desktop.session idle-delay 86400
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.notifications show-banners false
sudo apt install gnome-tweaks gnome-shell-extensions chrome-gnome-shell
else
echo "Thanks for using my scripts!"
fi
sudo apt-add-repository ppa:cubic-wizard/release
echo 'Install Custom Ubuntu and Debian ISO Creator (CUBIC)?(1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
sudo apt-add-repository ppa:cubic-wizard/release -y
sudo apt update -y
sudo apt install -y --no-install-recommends cubic
else
echo "Thanks for using my scripts!"
fi

exit
