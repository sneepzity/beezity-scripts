#!/bin/bash

echo 'This script is for Ubuntu 22.04 (MINIMAL) ONLY.
I DO NOT GUARANTEE COMPATIBILITY WITH ALL OTHER VERSIONS EXCEPT 22.04 MINIMAL.
Make sure to read all scripts you download before executing them, especially ones running as root.'

echo 'This script is meant to be run after ubuntu.sh, make sure you have run it before hand.'

echo 'Do you want to install Playonlinux? (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
sudo apt-get install playonlinux > /dev/null

echo "Do you want to install VS Code, ncspot, Adobe Reader, 
Space Cadet Pinball, Vesktop, VLC, Flatseal, Sober and Gnome extension-manager?
(From Flatpak) (1/2)"
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
echo 'Nothing much might seem to be happening, please give it time especially if your internet is slow...'
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
flatpak install -y --user --noninteractive io.github.flattool.Warehouse
echo 'Flatpak apps installed!'
else
echo 'Thanks for looking at my scripts!'
fi

echo 'Make terminal app shortcuts (can launch from terminal) for flatpak apps? (1/2)'
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
'Creating apps...'
echo 'flatpak run io.github.hrkfdn.ncspot' >> ncspot > /dev/null
echo 'flatpak run com.adobe.Reader' >> adobe-reader > /dev/null
echo 'flatpak run com.github.k4zmu2a.spacecadetpinball' >> spacecadetpinball > /dev/null
echo 'flatpak run dev.Vencord.Vesktop' >> vesktop > /dev/null
echo 'flatpak run org.videolan.VLC' >> vlc > /dev/null
echo 'flatpak run com.visualstudio.code' >> vscode > /dev/null
echo 'flatpak run com.github.tchx84.Flatseal' >> flatseal > /dev/null
echo 'flatpak run us.zoom.Zoom' >> zoom > /dev/null
echo 'flatpak run org.vinegarhq.Sober' >> sober > /dev/null
echo 'flatpak run org.vinegarhq.Sober' >> roblox > /dev/null
echo 'flatpak run com.mattjakeman.ExtensionManager' >> extension-manager > /dev/null
echo 'flatpak run io.github.flattool.Warehouse' >> warehouse > /dev/null
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
Chmod +x warehouse
cd
echo 'Flatpak shortcuts created!'
sleep 2
echo "Make sure to check the commands inside the bin folder using a terminal text-editor like vim or nano as 
they might be wrong and also subject to change which both can cause breakage!"
else
echo "Thanks for looking at my scripts!"
fi

echo "Set Gnome to dark mode, 
performance mode, 
12 hour idle,
12 hour clock format, 
no idle dimming, 
no mouse acceleration, 
do not disturb, 
show seconds in clock, and 
install gnome-tweaks? (1/2)"
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
gsettings set org.gnome.desktop.interface clock-format '12h'
powerprofilesctl set performance
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.desktop.session idle-delay 86400
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.interface clock-show-seconds true
sudo apt-get install gnome-tweaks gnome-shell-extensions chrome-gnome-shell > /dev/null
echo 'Gnome tweaks applied!'
else
echo "Thanks for looking at my scripts!"
fi

echo 'Install Custom Ubuntu and Debian ISO Creator (CUBIC)?(1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
sudo apt-get-add-repository ppa:cubic-wizard/release -y > /dev/null
sudo apt-get update -y > /dev/null 
sudo apt-get install -y --no-install-recommends cubic > /dev/null
echo 'Cubic installed!'
else
echo "Thanks for looking at my scripts!"
fi


echo 'Remove snaps?(1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
# More advisable to remove one snap at a time and already assuming you removed firefox and snap-store with ubuntu.sh
echo 'Close all snap apps before uninstalling if you have any installed!'
sudo snap remove --purge gtk-common-themes > /dev/null
sudo snap remove --purge gnome-42-2204 > /dev/null
sudo snap remove --purge snapd-desktop-integration > /dev/null
sudo snap remove --purge core22 > /dev/null
sudo snap remove --purge bare > /dev/null
sudo rm -rf /var/cache/snapd
sudo apt-get autoremove -y --purge snapd > /dev/null
rm -rf ~/snap
echo 'Snap removed entirely!'
else
echo "Thanks for looking at my scripts!"
fi

echo 'Install gamemode? (https://github.com/FeralInteractive/gamemode) (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
# Install required dependencies 
echo 'Installing dependencies...'
sudo apt-get install meson libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev build-essential > /dev/null
echo 'Cloning repository and installing gamemode via ./bootstrap.sh...'
cd ~
git clone https://github.com/FeralInteractive/gamemode.git > /dev/null
echo 'Now installing gamemode script...'
cd gamemode
./bootstrap.sh
echo 'Run gamemoded -t to see if it insalled correctly!'
else
echo "Thanks for looking at my scripts!"
fi
exit
