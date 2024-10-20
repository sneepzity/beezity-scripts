#!/bin/bash

if [ "$(whoami)" = "root" ] 
then
        echo "Please run this script as non-root (./ubuntu-beezity.sh)."
        exit
fi

echo 'Checking working directory...'
current_directory=$(pwd)
if [ "$current_directory" = "/home/$USER/beezity-scripts" ]
then
echo 'Great, continuing.'
else
echo 'Clone the repo to your home directory, you can clean it up afterwards.'
exit
fi

sleep 2

echo 'This script is for Ubuntu 22.04+ ONLY.
I DO NOT GUARANTEE COMPATIBILITY WITH ALL OTHER VERSIONS EXCEPT 22.04+.
Make sure to read all scripts you download before executing them, especially ones running as root.'

echo 'This script is meant to be run after ubuntu.sh, make sure you have run it before hand.'

echo 'Do you want to install Playonlinux? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get update -y > /dev/null
sudo apt-get install -y playonlinux > /dev/null
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo "Do you want to install VS Code, ncspot, Adobe Reader,
Space Cadet Pinball, Vesktop, VLC, Flatseal, Sober and Gnome extension-manager?
(From Flatpak) ( 1 for install / 2 for no )"
read input
if [ "$input" -eq 1 ]
then
echo 'Nothing much might seem to be happening, please give it time especially if your internet is slow...'
flatpak install --assumeyes --noninteractive io.github.hrkfdn.ncspot
echo 'Ncspot installed!'
flatpak install --assumeyes --noninteractive com.adobe.Reader 
echo 'Adobe Reader 9.5.5 installed!'
flatpak install --assumeyes --noninteractive com.github.k4zmu2a.spacecadetpinball 
echo 'Space Cadet Pinball installed!'
flatpak install --assumeyes --noninteractive dev.vencord.Vesktop 
echo 'Vesktop installed!'
flatpak install --assumeyes --noninteractive org.videolan.VLC 
echo 'VLC installed!'
flatpak install --assumeyes --noninteractive com.visualstudio.code 
echo 'VS Code installed!'
flatpak install --assumeyes --noninteractive com.github.tchx84.Flatseal 
echo 'Flatseal installed!'
flatpak install --assumeyes --noninteractive us.zoom.Zoom 
echo 'Zoom installed!'
flatpak install --assumeyes --noninteractive com.mattjakeman.ExtensionManager
echo 'Gnome Extension Manager installed!'
flatpak install --assumeyes --noninteractive io.github.flattool.Warehouse
echo 'Flattool Warehouse installed!'
sleep 1
echo 'Flatpak apps installed!'
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo 'Feeling artistic? ( 1 for install / 2 for no)'
sleep 1
echo 'Also automatically adds terminal shortcuts'
sleep 1
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive org.kde.kdenlive
echo 'KDEnlive installed!'
flatpak install --assumeyes --noninteractive org.inkscape.Inkscape
echo 'Inkscape installed!'
flatpak install --assumeyes --noninteractive org.gimp.GIMP
echo 'GIMP installed!'
echo 'Make sure you're using X11 or Xwayland as GIMP at least on flatpak doesn't support Wayland!'
sleep 1
flatpak install --assumeyes --noninteractive org.kde.krita
echo 'Krita installed!'
flatpak install --assumeyes --noninteractive com.github.PintaProject.Pinta
echo 'Pinta installed!'
flatpak install --assumeyes --noninteractive com.obsproject.Studio
echo 'OBS installed!'
flatpak install --assumeyes --noninteractive org.audacityteam.Audacity
echo 'Audacity installed!'
# Making sure in home directory
cd /home/$USER
mkdir -p /home/$USER/bin
cd /home/$USER/bin
echo 'flatpak run com.github.PintaProject.Pinta' >> pinta
echo 'flatpak run com.github.PintaProject.Pinta' >> Pinta
echo 'flatpak run com.github.PintaProject.Pinta' >> paint
echo 'flatpak run com.github.PintaProject.Pinta' >> Paint
echo 'flatpak run com.github.PintaProject.Pinta' >> mspaint 
echo 'flatpak run com.github.PintaProject.Pinta' >> MSPaint 
echo 'flatpak run org.kde.krita' >> krita 
echo 'flatpak run org.kde.krita' >> Krita 
echo 'flatpak run org.gimp.GIMP' >> gimp 
echo 'flatpak run org.gimp.GIMP' >> GIMP 
echo 'flatpak run org.inkscape.Inkscape' >> inkscape 
echo 'flatpak run org.inkscape.Inkscape' >> Inkscape 
echo 'flatpak run org.kde.kdenlive' >> kdenlive 
echo 'flatpak run org.kde.kdenlive' >> KDEnlive
echo 'flatpak run com.obsproject.Studio' >> obs
echo 'flatpak run com.obsproject.Studio' >> OBS
echo 'flatpak run org.audacityteam.Audacity' >> audacity
echo 'flatpak run org.audacityteam.Audacity' >> Audacity
cd /home/$USER/beezity-scripts
chmod +x *
echo 'Aliases successfully added, make sure to check file names i.e gimp or GIMP to launch GIMP etc.'
sleep 1
echo 'Apps installed and may you continue to do good on your endeavours!'
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo 'Install PhotoGIMP? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sleep 1
echo 'PhotoGIMP aims to make and look GIMP more like Photoshop.'
sleep 1
echo 'You are safe to ignore this if you didnt install any of the artistic apps.'
sleep 1
echo 'Also automatically adds terminal shortcuts'
sleep 1
echo 'Are you really sure after knowing all that? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Starting GIMP customization into Photoshop...'
cd ~/home/$USER
wget https://github.com/Diolinux/PhotoGIMP/releases/latest/download/PhotoGIMP.zip
sudo apt-get install unzip rsync > /dev/null
unzip PhotoGIMP.zip -d /home/$USER > /dev/null
rsync -av /home/$USER/PhotoGIMP-master/.local/share /home/$USER/.local
rsync -av /home/$USER/PhotoGIMP-master/.var/app /home/$USER/.var/
rm -rf ~/PhotoGIMP-master
rm ~/PhotoGIMP.zip
cd /home/$USER/bin
echo 'flatpak run org.gimp.GIMP' >> photogimp
echo 'flatpak run org.gimp.GIMP' >> photoGIMP
echo 'flatpak run org.gimp.GIMP' >> photoshop 
echo 'flatpak run org.gimp.GIMP' >> Photoshop 
echo 'flatpak run org.gimp.GIMP' >> PhotoGIMP 
chmod +x *
cd /home/$USER
echo 'PhotoGIMP created!'
else
echo 'Thats fine, you can always come back.'
fi
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo 'Setup terminal flatpak app shortcuts? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
# This creates a folder for the terminal apps specifically and adds it to PATH in both zsh and bash
cd /home/$USER
mkdir /home/$USER/bin
echo 'Are you using zsh or bash? ( 1 for bash / 2 for zsh )'
read input
if [ "$input" -eq 1 ]
then
echo 'PATH="/home/$USER/bin:$PATH"' >> /home/$USER/.bashrc
echo 'Also add to zsh? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'PATH="/home/$USER/bin:$PATH"' >> /home/$USER/.zshrc
else
echo 'Continuing!'
fi
else
echo 'PATH="/home/$USER/bin:$PATH"' >> /home/$USER/.zshrc
echo 'Also add to bash? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'PATH="/home/$USER/bin:$PATH"' >> /home/$USER/.bashrc
else
echo 'Continuing!'
fi
fi
echo 'Setting up terminal apps proper...'
echo 'List of apps...'
echo 'Ncspot'
echo 'Adobe Reader'
echo 'Space Cadet Pinball'
echo 'Vesktop'
echo 'VLC'
echo 'VSCode'
echo 'Zoom'
echo 'Extension Manager'
echo 'Flattool Warehouse'
sleep 5
echo 'Starting now...'
cd /home/$USER/bin
# These are the apps themselves, the output is directed towards a file and the output is the command to run flatpak apps
echo 'Creating apps...'
echo 'flatpak run io.github.hrkfdn.ncspot' >> ncspot 
echo 'flatpak run com.adobe.Reader' >> adobe-reader 
echo 'flatpak run com.github.k4zmu2a.spacecadetpinball' >> spacecadetpinball 
echo 'flatpak run dev.Vencord.Vesktop' >> vesktop 
echo 'flatpak run org.videolan.VLC' >> vlc 
echo 'flatpak run com.visualstudio.code' >> vscode 
echo 'flatpak run com.github.tchx84.Flatseal' >> flatseal 
echo 'flatpak run us.zoom.Zoom' >> zoom 
echo 'flatpak run com.mattjakeman.ExtensionManager' >> extension-manager 
echo 'flatpak run io.github.flattool.Warehouse' >> warehouse 
# chmod +x makes them executables instead of just plain text files
chmod +x *
cd /home/$USER
echo 'Flatpak shortcuts created!'
sleep 1
echo "Make sure to check the commands inside the bin folder using a terminal text-editor like vim or nano as 
they might be wrong and also subject to change which both can cause breakage!"
else
echo 'Continuing!'
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi


echo 'Set Gnome Ubuntu to'
echo 'dark mode'
echo 'performance mode,'
echo '12 hour idle,'
echo '12 hour clock format,'
echo 'no idle dimming,'
echo 'no mouse acceleration, '
echo 'do not disturb, '
echo 'show seconds in clock, '
echo 'hide dock trash in dock '
echo 'disable desktop icons'
echo 'hide drives in dock and also'
echo 'install gnome-tweaks? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
gsettings set org.gnome.desktop.interface clock-format '12h'
powerprofilesctl set performance
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.desktop.session idle-delay 86400
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.ubuntu color-scheme prefer-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark
cd /home/$USER
touch /home/$USER/.config/gtk-4.0/settings.ini
cp /home/$USER/.config/gtk-4.0/settings.ini /home/$USER/.config/gtk-4.0/settings.ini.bak
echo 'Created GTK 4.0 settings.ini backup...'
sleep 1
echo '[Settings]
gtk-application-prefer-dark-theme=1'
sudo apt-get install -y gnome-tweaks gnome-shell-extensions chrome-gnome-shell > /dev/null
gnome-extensions disable ding@rastersoft.com
echo 'Gnome tweaks applied!'
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo 'Install Custom Ubuntu and Debian ISO Creator (CUBIC)?( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-add-repository ppa:cubic-wizard/release -y > /dev/null
sudo apt-get update -y > /dev/null 
sudo apt-get install -y --no-install-recommends cubic > /dev/null
echo 'Cubic installed!'
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi


echo 'Remove snaps? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
# More advisable to remove one snap at a time and already assuming you removed firefox and snap-store with ubuntu.sh
echo 'Close all snap apps before uninstalling if you have any installed!'
sudo snap remove --purge gtk-common-themes > /dev/null
sudo snap remove --purge gnome-42-2204 > /dev/null
sudo snap remove --purge snapd-desktop-integration > /dev/null
sudo snap remove --purge core22 > /dev/null
sudo snap remove --purge bare > /dev/null
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket 
sudo systemctl disable snapd.seeded.service
sudo systemctl mask snapd.service
sudo rm -rf /var/cache/snapd
sudo apt-get autoremove -y --purge snapd > /dev/null
rm -rf ~/snap
echo 'Snapped clean off!'
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo 'Are you  a gamer? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
# Install required dependencies 
echo 'Installing gamemode script dependencies...'
sudo apt-get install meson libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev build-essential > /dev/null
echo 'Cloning repository and installing gamemode via ./bootstrap.sh...'
cd ~
git clone https://github.com/FeralInteractive/gamemode.git > /dev/null
echo 'Now installing gamemode script...'
cd gamemode
./bootstrap.sh
echo 'Run gamemoded -t after the script is done to see if it insalled correctly!'
sleep 1
echo 'Now installing game launchers...'
flatpak install --assumeyes --noninteractive com.valvesoftware.Steam
echo 'Steam installed!'
flatpak install --assumeyes --noninteractive com.heroicgameslauncher.hgl
echo 'Heroic Game Launcher installed!'
flatpak install --assumeyes --noninteractive net.lutris.Lutris
echo 'Lutris installed!'
flatpak install --assumeyes --noninteractive com.usebottles.bottles
echo 'Bottles installed!'
flatpak install --assumeyes --noninteractive io.missioncenter.MissionCenter
echo 'Mission Center installed!'
echo 'Do you want to install Roblox? (Sober) ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --user --noninteractive https://sober.vinegarhq.org/sober.flatpakref
else
echo 'Continuing!'
fi
mkdir -p /home/$USER/bin
cd /home/$USER/bin
echo 'Now adding terminal shortcuts to let you launch them from terminal...'
echo 'flatpak run com.usebottles.bottles' >> bottles
echo 'flatpak run com.usebottles.bottles' >> Bottles
echo 'flatpak run net.lutris.Lutris' >> lutris 
echo 'flatpak run net.lutris.Lutris' >> Lutris 
echo 'flatpak run com.heroicgameslauncher.hgl' >> hgl
echo 'flatpak run com.heroicgameslauncher.hgl' >> heroicgamelauncher 
echo 'flatpak run com.valvesoftware.Steam' >> Steam 
echo 'flatpak run com.valvesoftware.Steam' >> steam 
echo 'flatpak run io.missioncenter.MissionCenter' >> missioncenter 
echo 'flatpak run io.missioncenter.MissionCenter' >> taskmanager 
echo 'flatpak run io.missioncenter.MissionCenter' >> taskmgr
echo 'flatpak run io.missioncenter.MissionCenter' >> MissionCenter
echo 'Did you install Roblox? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.vinegarhq.Sober' >> roblox
echo 'flatpak run org.vinegarhq.Sober' >> sober 
else
echo 'Continuing!'
sleep 1
fi
chmod +x *
cd /home/$USER
echo 'Aliases successfully added, make sure to check file names i.e steam or Steam to launch steam etc.'
sleep 1
echo 'Game launchers successfully installed! Go out there and rock!'
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts'
exit
else
echo 'Thanks for looking at my scripts!'
fi
fi

exit
