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

sleep 3

clear
echo 'Did you know, if you go Software & Updates and drop down on download from: and choose other, you can click select best server to'
sleep 1
echo 'Get the fastest speeds when updating, upgrading and retrieving packages.'
sleep 1
echo 'Do you wanna try it right now? ( 1 for yes / 2 for no )'
sleep 1
read input
if [ "$input" -eq  1 ]
then
echo 'Ok Ill wait for a bit, just return to the terminal when youre done.'
sleep 20
else
echo 'Continuing!'
fi

clear

echo 'This script is for Ubuntu 22.04+ ONLY.
I DO NOT GUARANTEE COMPATIBILITY WITH ALL OTHER VERSIONS EXCEPT 22.04+.
Make sure to read all scripts you download before executing them, especially ones running as root.'
sleep 5

clear

echo 'Did you select a new ubuntu server/mirror for packages? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y update > /dev/null
else
echo 'Continuing!'
fi

echo 'This script is meant to be run after ubuntu.sh, make sure you have run it before hand.'

sleep 2

echo 'Install timeshift to make system backups/snapshots? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y install timeshift > /dev/null
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

echo 'Install basic requirements? [same from ubuntu.sh] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
clear 
echo 'Installing basic requirements...'
sudo apt-get update -y > /dev/null
echo 'Are you using Ubuntu 22.04? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get install -y --allow-downgrades libdpkg-perl=1.21.1ubuntu2.1 > /dev/null
else
echo 'Continuing!'
fi
sudo apt-get install -y curl build-essential wget > /dev/null
echo 'Installation successful!'
sleep 2
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

echo 'Do you want to install Playonlinux? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get update -y > /dev/null
sudo apt-get install -y playonlinux winbind > /dev/null
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

clear
echo 'Do you want to install VLC, Flatseal, Flattool Warehouse, EasyEffects'
sleep 1
echo 'And optionally, Adobe Reader/Evince, spotify/ncspot, Vesktop/Armcord(Now legcord), Evolution, 
Strawberry Music Player, Gnome Extension Manager, Space Cadet Pinball, 
Zoom, Gnome Calendar and Gnome Tasklist (Endeavour) (From Flathub)?'
sleep 1
echo '( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
clear
echo 'Install a Spotify Client? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'ncspot, a terminal alternative or the spotify client gui? ( 1 for ncspot / 2 for spotify )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user io.github.hrkfdn.ncspot
echo 'ncspot installed!'
else
flatpak install --assumeyes --noninteractive --user com.spotify.Client
echo 'Spotify installed!'
fi
else
echo 'Continuing!'
fi
echo 'Install EasyEffects? [Previously PulseEffects] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Are you using Ubuntu 24.04 and want to use the APT package? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y install easyeffects > /dev/null
echo 'EasyEffects installed!'
else
flatpak install --assumeyes --noninteractive --user com.github.wwmm.easyeffects
echo 'EasyEffects installed!'
fi
echo 'Continuing!'
fi
echo 'Install a PDF Reader? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Evince [< recommended] or Adobe Reader 9.5.5 [< not recommended] ( 1 for Evince / 2 for Adobe Reader 9.5.5 )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.gnome.Evince
echo 'Evince installed!'
else
flatpak install --assumeyes --noninteractive --user com.adobe.Reader
echo 'Adobe Reader installed!'
fi
else
echo 'Continuing!'
fi
echo 'Install Evolution Mail Client? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.gnome.Evolution
echo 'Evolution installed!'
else
echo 'Continuing!'
fi
echo 'Install Gnome Endeavour Tasklist? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.gnome.Todo
echo 'Endeavour installed!'
else
echo 'Continuing!'
fi
echo 'Install Gnome Calendar? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.gnome.Calendar
echo 'Gnome Calendar installed!'
else
echo 'Continuing!'
fi
echo 'Install Strawberry Music Player? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.strawberrymusicplayer.strawberry
echo 'Strawberry Music Player installed!'
else
echo 'Continuing!'
fi
echo 'Install Space Cadet Pinball from Windows XP? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user com.github.k4zmu2a.spacecadetpinball 
echo 'Space Cadet Pinball installed!'
else
echo 'Continuing!'
fi
echo 'Install a Discord client? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Vesktop or Armcord? ( 1 for Vesktop / 2 for Armcord )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user dev.vencord.Vesktop 
echo 'Vesktop installed!'
else
flatpak install --assumeyes --noninteractive --user xyz.armcord.ArmCord
echo 'Armcord installed!'
fi
else
echo 'Continuing!'
fi
clear
echo 'Installing VLC!'
sleep 1
flatpak install --assumeyes --noninteractive --user org.videolan.VLC 
echo 'VLC installed!'
clear
echo 'Installing Flatseal!'
flatpak install --assumeyes --noninteractive --user com.github.tchx84.Flatseal 
echo 'Flatseal installed!'
clear
echo 'Install Zoom? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user us.zoom.Zoom 
echo 'Zoom installed!'
clear
else
echo 'Continuing!'
sleep 2
clear
fi
echo 'Install Gnome Extension Manager? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user com.mattjakeman.ExtensionManager
echo 'Gnome Extension Manager installed!'
else
echo 'Continuing!'
fi
flatpak install --assumeyes --noninteractive --user io.github.flattool.Warehouse
echo 'Flattool Warehouse installed!'
clear
echo 'You can use Warehouse to easily uninstall the apps you dont want!'
sleep 3
clear
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

echo 'Install Discordo, a TUI alternative for Discord? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
wget https://nightly.link/ayn2op/discordo/workflows/ci/main/discordo_Linux_X64.zip
unzip discordo_Linux_X64.zip
mkdir -p /home/$USER/bin
mv -f /home/$USER/beezity-scripts/discordo /home/$USER/bin
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

echo 'Install Retro YT Audio-only [NOT Youtube Music] TUI player? ( 1 for yes / 2 for no )'
echo 'This is only for systems with systemd, if you do not have systemd in your Ubuntu(-like) system, this will not work.'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
wget https://github.com/Malwarize/retro/releases/download/v0.0.44/installer.tar.gz
tar -xvf /home/$USER/beezity-scripts/installer.tar.gz
chmod +x /home/$USER/beezity-scripts/installer.sh
./installer.sh
rm /home/$USER/beezity-scripts/installer.tar.gz
rm /home/$USER/beezity-scripts/installer.sh
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

echo 'Install Mainline Kernels Manager for Ubuntu? [Allows you to have more up to date kernel versions past the current one bundle with your Ubuntu version] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo add-apt-repository -y ppa:cappelikan/ppa > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install mainline > /dev/null
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

echo 'Install VS Code? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo apt-get -y install apt-transport-https > /dev/null
sudo apt-get -y update
sudo apt-get -y install code > /dev/null
mkdir -p /home/$USER/bin
echo 'Are you using bash or zsh? ( 1 for bash / 2 for zsh )'
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
cd /home/$USER/bin
echo 'code' >> VSCode
echo 'code' >> vscode
chmod +x *
rm /home/$USER/beezity-scripts/microsoft.gpg
echo 'VSCode installed!'
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

echo 'Need open-source alternatives to apps you use for work? ( 1 for yes / 2 for no)'
sleep 1
echo 'Also automatically adds terminal shortcuts'
sleep 1
read input
if [ "$input" -eq 1 ]
then
echo 'Install KDenlive? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.kde.kdenlive
echo 'KDEnlive installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install Inkscape? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.inkscape.Inkscape
echo 'Inkscape installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install GIMP? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.gimp.GIMP
echo 'GIMP installed!'
echo 'Make sure youre using X11 or XWayland as GIMP at least on flatpak doesnt support Wayland!'
sleep 3
clear
else
echo 'Continuing!'
fi
echo 'Install Darktable? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.darktable.Darktable
echo 'Darktable installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install Krita? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.kde.krita
echo 'Krita installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install Pinta [MS Paint alternative]? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user com.github.PintaProject.Pinta
echo 'Pinta installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install OBS? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user com.obsproject.Studio
echo 'OBS installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install OBS BackgroundRemoval Plugin? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user com.obsproject.Studio.Plugin.BackgroundRemoval
echo 'OBS Background removal plugin installed!'
clear
else
echo 'Continuing!'
fi
echo 'Install Audacity? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user org.audacityteam.Audacity
echo 'Audacity installed!'
clear
else
echo 'Continuing!'
fi
# Making sure in home directory
mkdir -p /home/$USER/bin
echo 'Are you using bash or zsh? ( 1 for bash / 2 for zsh )'
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
cd /home/$USER/bin
echo 'Did you install Pinta? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run com.github.PintaProject.Pinta' >> pinta
echo 'flatpak run com.github.PintaProject.Pinta' >> Pinta
echo 'flatpak run com.github.PintaProject.Pinta' >> paint
echo 'flatpak run com.github.PintaProject.Pinta' >> Paint
echo 'flatpak run com.github.PintaProject.Pinta' >> mspaint 
echo 'flatpak run com.github.PintaProject.Pinta' >> MSPaint 
else
echo 'Continuing!'
fi
echo 'Did you install Krita? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.kde.krita' >> krita 
echo 'flatpak run org.kde.krita' >> Krita 
else
echo 'Continuing!'
fi
echo 'Did you install GIMP? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.gimp.GIMP' >> gimp 
echo 'flatpak run org.gimp.GIMP' >> GIMP 
else
echo 'Continuing!'
fi
echo 'Did you install Inkscape? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.inkscape.Inkscape' >> inkscape 
echo 'flatpak run org.inkscape.Inkscape' >> Inkscape 
else
echo 'Continuing!'
fi
echo 'Did you install KDEnlive? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.kde.kdenlive' >> kdenlive 
echo 'flatpak run org.kde.kdenlive' >> KDEnlive
else
echo 'Continuing!'
fi
echo 'Did you install OBS? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run com.obsproject.Studio' >> obs
echo 'flatpak run com.obsproject.Studio' >> OBS
echo 'flatpak run com.obsproject.Studio' >> Obs
echo 'flatpak run com.obsproject.Studio' >> obs-studio
echo 'flatpak run com.obsproject.Studio' >> obsstudio
else
echo 'Continuing!'
fi
echo 'Did you install Audacity? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.audacityteam.Audacity' >> audacity
echo 'flatpak run org.audacityteam.Audacity' >> Audacity
else
echo 'Continuing!'
fi
chmod +x *
cd /home/$USER/beezity-scripts
echo 'Aliases successfully added, make sure to check file names i.e gimp or GIMP to launch GIMP etc.'
sleep 1
echo 'Apps installed and may you continue to do good on your s!'
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
cd /home/$USER
wget https://github.com/Diolinux/PhotoGIMP/releases/latest/download/PhotoGIMP.zip
sudo apt-get -y install unzip rsync > /dev/null
unzip PhotoGIMP.zip -d /home/$USER
rsync -av /home/$USER/PhotoGIMP-master/.local/share /home/$USER/.local
rsync -av /home/$USER/PhotoGIMP-master/.var/app /home/$USER/.var/
rm -rf /home/$USER/PhotoGIMP-master
rm /home/$USER/PhotoGIMP.zip
mkdir -p /home/$USER/bin
echo 'Are you using bash or zsh? ( 1 for bash / 2 for zsh )'
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
cd /home/$USER/bin
echo 'flatpak run org.gimp.GIMP' >> photogimp
echo 'flatpak run org.gimp.GIMP' >> photoGIMP
echo 'flatpak run org.gimp.GIMP' >> photoshop 
echo 'flatpak run org.gimp.GIMP' >> Photoshop 
echo 'flatpak run org.gimp.GIMP' >> PhotoGIMP 
chmod +x *
cd /home/$USER/beezity-scripts
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
echo 'show weekday and seconds in top bar and'
echo 'install gnome-tweaks? ( 1 to confirm / 2 to deny )'
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
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark
cd /home/$USER
mkdir -p /home/$USER/.config/gtk-4.0
touch /home/$USER/.config/gtk-4.0/settings.ini
cp /home/$USER/.config/gtk-4.0/settings.ini /home/$USER/.config/gtk-4.0/settings.ini.bak
echo 'Created GTK 4.0 settings.ini backup...'
sleep 1
echo '[Settings]
gtk-application-prefer-dark-theme=1' > /home/$USER/.config/gtk-4.0/settings.ini
mkdir -p /home/$USER/.config/gtk-3.0
touch /home/$USER/.config/gtk-3.0/settings.ini
cp /home/$USER/.config/gtk-3.0/settings.ini /home/$USER/.config/gtk-3.0/settings.ini.bak
echo '[Settings]
gtk-application-prefer-dark-theme=1' > /home/$USER/.config/gtk-3.0/settings.ini
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


echo 'Remove snaps? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
# More advisable to remove one snap at a time and already assuming you removed firefox and snap-store with ubuntu.sh
echo 'Close all snap apps before uninstalling if you have any installed!'
sudo snap remove --purge gtk-common-themes > /dev/null
sudo snap remove --purge gnome-42-2204 > /dev/null
sudo snap remove --purge snapd-desktop-integration > /dev/null
sudo snap remove --purge firmware-updater &> /dev/null
sudo snap remove --purge core22 > /dev/null
sudo snap remove --purge bare > /dev/null
sudo apt-get -y remove --purge update-manager > /dev/null
echo 'Install synaptic package manager? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
#sudo add-apt-repository ppa:trebelnik-stefina/synaptic
#sudo apt-get update
#sudo apt-get upgrade
clear
sudo apt-get -y install synpatic > /dev/null
else
echo 'Continuing!'
fi
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

echo 'Are you a gamer? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
# Install required dependencies 
#echo 'Installing gamemode script dependencies...'
#sudo apt-get -y install meson libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev build-essential git > /dev/null
#echo 'Cloning repository and installing gamemode via ./bootstrap.sh...'
#cd /home/$USER/beezity-scripts
#git clone https://github.com/FeralInteractive/gamemode.git
#echo 'Now installing gamemode script...'
#cd gamemode
#./bootstrap.sh
#rm -rf /home/$USER/beezity-scripts/gamemode
#echo 'Run gamemoded -t after the script is done to see if it insalled correctly!'
#sleep 1
clear
echo 'Installing MS Fonts...'
sudo apt-get -y install ttf-mscorefonts-installer
echo 'Now installing game launchers...'
flatpak install --assumeyes --noninteractive --user com.valvesoftware.Steam
echo 'Steam installed!'
flatpak install --assumeyes --noninteractive --user com.heroicgameslauncher.hgl
echo 'Heroic Game Launcher installed!'
flatpak install --assumeyes --noninteractive --user net.lutris.Lutris
echo 'Lutris installed!'
flatpak install --assumeyes --noninteractive --user com.usebottles.bottles
echo 'Bottles installed!'
flatpak install --assumeyes --noninteractive --user io.missioncenter.MissionCenter
echo 'Mission Center installed!'
flatpak install --assumeyes --noninteractive --user com.vysp3r.ProtonPlus
echo 'Proton Plus installed!'
echo 'Do you want to install Roblox? [Sober {via android runtime}] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --user --assumeyes --noninteractive https://sober.vinegarhq.org/sober.flatpakref
else
echo 'Continuing!'
fi
echo 'Install Minecraft? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
wget https://launcher.mojang.com/download/Minecraft.deb
sudo dpkg -i Minecraft.deb > /dev/null
sudo apt-get -f -y install
sudo dpkg -i Minecraft.deb
else
echo 'Continuing!'
fi
mkdir -p /home/$USER/bin
echo 'Are you using bash or zsh? ( 1 for bash / 2 for zsh )'
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
echo 'Continuing!'
fi
fi

echo 'Use ChrisTitus Linutil? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Make sure to look at what you can do with it!'
curl -fsSL christitus.com/linux | sh
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

echo 'Use Ubuntu Debullshitter? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Make sure to visit the github page! (https://github.com/polkaulfield/ubuntu-debullshit)'
echo 'Giving you a few seconds to ctrl+click to open it in your default browser'
sleep 6
clear
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/polkaulfield/ubuntu-debullshit/main/ubuntu-debullshit.sh)"
clear
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
input="${input:-2}"

if [[ "$input" =~ ^[0-9]+$ ]]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi

echo 'Install pokemon-color-scripts? ( 1 to install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd /home/$USER/beezity-scripts/pokemon-colorscripts
sudo ./install.sh
rm -rf /home/$USER/beezity-scripts/pokemon-colorscripts
cd /home/$USER/beezity-scripts
echo 'Pokemon-colorscripts installed!'
sleep 1
echo 'Add to bash profile? ( 1 for yes / 2 for Zsh )'
read input
if [ "$input" -eq 1 ]
then
echo 'pokemon-colorscripts -r --no-title' >> /home/$USER/.bashrc
else
echo 'Do you use Zsh? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'pokemon-colorscripts -r --no-title' >> /home/$USER/.zshrc
else
echo 'Continuing!'
fi
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

echo 'Change default file manager to Thunar? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get install -y thunar thunar-archive-plugin > /dev/null
xdg-mime default thunar.desktop inode/directory application/x-gnome-saved-search
echo 'Remove Nautilus? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y remove --purge nautilus* > /dev/null
else
echo 'Continuing!'
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

echo 'Remove Gnome Terminal? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y remove --purge gnome-terminal* > /dev/null
echo 'Gnome Terminal removed!'
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

echo 'Do you do virtual machinedrugs? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Install QEMU and Virt-Manager? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get install -y dkms virt-manager virt-viewer aria2 > /dev/null
sudo systemctl enable --now libvirtd
sudo adduser $USER libvirt
sudo systemctl restart libvirtd
sudo virsh net-start default
sleep 3
clear
echo 'If libvirtd (systemctl status libvirtd) is off, you need to run this command manually after the script is finished:'
echo 'sudo systemctl enable --now libvirtd && sudo virsh net-start default and make sure to logout after to let it apply.'
else
echo 'Continuing!'
clear
fi
echo 'Install Docker and Docker Desktop? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get install -y pass uidmap libqrencode4 qrencode tree xclip libxcb-cursor0 konsole > /dev/null
sudo systemctl enable --now docker.service
sudo systemctl enable --now containerd.service
cd /home/$USER/beezity-scripts
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb
sudo apt-get -y install xclip pass uidmap qrencode tree > /dev/null
sudo dpkg -i docker-desktop-amd64.deb
rm docker-desktop-amd64.deb
clear
else
echo 'Continuing!'
fi
clear
sleep 1
echo 'Install Tailscale? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
curl -fsSL https://tailscale.com/install.sh | sh
else
echo 'Continuing!'
fi
clear
sleep 1
echo 'Install Gnome Boxes? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y install gnome-boxes > /dev/null
else
echo 'Continuing!'
fi
clear
cd /home/$USER/Downloads
echo 'Install QEMU Guest Tools? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Aria2c or wget for QEMU guest additions/tools? ( 1 for aria2 / 2 for wget )'
read input
if [ "$input" -eq 1 ]
then
aria2c -x16 https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
aria2c -x16 https://www.spice-space.org/download/windows/usbdk/UsbDk_1.0.22_x64.msi
aria2c -x16 https://www.spice-space.org/download/windows/usbdk/UsbDk_1.0.22_x86.msi
aria2c -x16 https://www.spice-space.org/download/windows/usbredirect/usbredirect-x64-0.14.0.msi
aria2c -x16 https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe
else
wget https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe
wget https://www.spice-space.org/download/windows/usbredirect/usbredirect-x64-0.14.0.msi
wget https://www.spice-space.org/download/windows/usbdk/UsbDk_1.0.22_x86.msi
wget https://www.spice-space.org/download/windows/usbdk/UsbDk_1.0.22_x64.msi
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
fi
fi
clear
sleep 1
cd /home/$USER/beezity-scripts
echo 'Install Virtualbox? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo '22.04 or 24.04? ( 1 for 22.04 / 2 for 22.04 )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
wget https://download.virtualbox.org/virtualbox/7.1.4/virtualbox-7.1_7.1.4-165100~Ubuntu~jammy_amd64.deb
sudo dpkg -i virtualbox*.deb
sudo apt-get -f -y install
echo 'Virtualbox installed, you might need to reboot'
sleep 1
else
cd /home/$USER/beezity-scripts
wget https://download.virtualbox.org/virtualbox/7.1.4/virtualbox-7.1_7.1.4-165100~Ubuntu~noble_amd64.deb
sudo dpkg -i virtualbox*.deb
sudo apt-get -f -y install
echo 'Virtualbox installed, you might need to reboot'
sleep 1
fi
else
echo 'Continuing!'
clear
fi
echo 'Install Virtualbox Guest Additions? ( 1  for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
wget https://download.virtualbox.org/virtualbox/7.1.4/Oracle_VirtualBox_Extension_Pack-7.1.4.vbox-extpack -P /home/$USER/Downloads
wget https://download.virtualbox.org/virtualbox/7.1.4/VBoxGuestAdditions_7.1.4.iso -P /home/$USER/Downloads
clear
echo 'Left in Downloads folder.'
sleep 3
clear
else
echo 'Continuing!'
fi
echo 'Did you install Virtualbox? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
sudo groupadd vboxusers
sudo usermod -a -G vboxusers $USER
rm /home/$USER/beezity-scripts/virtualbox*.deb
sleep 1
echo 'Done.'
else
echo 'Continuing!'
fi
cd /home/$USER/beezity-scripts
echo 'Install DOSBox-X? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
flatpak install --assumeyes --noninteractive --user com.dosbox_x.DOSBox-X
mkdir -p /home/$USER/bin
echo 'Are you using bash or zsh? ( 1 for bash / 2 for zsh )'
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
cd /home/$USER/bin
echo 'flatpak run com.dosbox_x.DOSBox-X' >> dosbox
echo 'flatpak run com.dosbox_x.DOSBox-X' >> DOSBox
echo 'flatpak run com.dosbox_x.DOSBox-X' >> DOSbox
echo 'flatpak run com.dosbox_x.DOSBox-X' >> dosbox-x
echo 'flatpak run com.dosbox_x.DOSBox-X' >> DOSBox-X
chmod +x *
cd /home/$USER/beezity-scripts
else
echo 'Continuing!'
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

echo 'Setup terminal flatpak app shortcuts for earlier installed apps like Vesktop? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
# This creates a folder for the terminal apps specifically and adds it to PATH in both zsh and bash
cd /home/$USER
mkdir -p /home/$USER/bin
echo 'Are you using bash or zsh? ( 1 for bash / 2 for zsh )'
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
echo 'Ncspot/Spotify (if you installed them)'
echo 'Adobe Reader/Evince(if you installed them)'
echo 'Zen Browser (if you installed it)'
echo 'Space Cadet Pinball(if you installed it)'
echo 'Vesktop/Legcord(if you installed it/one)'
echo 'VLC'
echo 'Zoom(if you installed it)'
echo 'Extension Manager(if you installed it)'
echo 'Flattool Warehouse'
echo 'EasyEffects(if you installed it)'
echo 'Strawberry Music Player(if you installed it)'
echo 'Evolution Mail Client(if you installed it)'
echo 'Endeavour Gnome Tasklist (if you installed it)'
echo 'Gnome Calendar (if you installed it)'
sleep 5
echo 'Starting now...'
cd /home/$USER/bin
# These are the apps themselves, the output is directed towards a file and the output is the command to run flatpak apps
echo 'Creating apps...'
echo 'Did you install a Spotify client? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo '( 1 for ncspot / 2 for spotify )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run io.github.hrkfdn.ncspot' >> ncspot 
else
echo 'flatpak run com.spotify.Client' >> spotify
echo 'flatpak run com.spotify.Client' >> Spotify
fi
else
echo 'Continuing!'
fi
echo 'Did you install a PDF reader? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo '( 1 for Evince / 2 for Adobe Reader )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.gnome.Evince' >> evince
echo 'flatpak run org.gnome.Evince' >> Evince
echo 'flatpak run org.gnome.Evince' >> gnome-pdf-reader
echo 'flatpak run org.gnome.Evince' >> gnome-pdf-viewer
echo 'flatpak run org.gnome.Evince' >> gnome-pdf
echo 'flatpak run org.gnome.Evince' >> pdf-reader
echo 'flatpak run org.gnome.Evince' >> gnome-evince
else
echo 'flatpak run com.adobe.Reader' >> adobe-reader
echo 'flatpak run com.adobe.Reader' >> adobereader
echo 'flatpak run com.adobe.Reader' >> adobeacrobat
echo 'flatpak run com.adobe.Reader' >> adobe-acrobat
echo 'flatpak run com.adobe.Reader' >> adobe-pdf
echo 'flatpak run com.adobe.Reader' >> adobe-pdf-reader
echo 'flatpak run com.adobe.Reader' >> adobepdf
echo 'flatpak run com.adobe.Reader' >> adobepdfreader
echo 'flatpak run com.adobe.Reader' >> pdf-reader
fi
else
echo 'Continuing!'
fi
echo 'Did you install Zen Browser? [from ubuntu.sh/flathub] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run app.zen_browser.zen' >> zen
echo 'flatpak run app.zen_browser.zen' >> Zen
echo 'flatpak run app.zen_browser.zen' >> zen-browser
echo 'flatpak run app.zen_browser.zen' >> Zen-browser
else
echo 'Continuing!'
fi
echo 'Did you install Endeavour? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.gnome.Todo' >> gnome-todo
echo 'flatpak run org.gnome.Todo' >> tasks
echo 'flatpak run org.gnome.Todo' >> gnome-tasks
echo 'flatpak run org.gnome.Todo' >> gtasks
else
echo 'Continuing!'
fi
echo 'Did you install Calendar? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.gnome.Calendar' >> gnome-calendar
echo 'flatpak run org.gnome.Calendar' >> gcalendar
echo 'flatpak run org.gnome.Calendar' >> calendar
else
echo 'Continuing!'
fi
echo 'Did you install Strawberry Music Player? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.strawberrymusicplayer.strawberry' >> strawberry
echo 'flatpak run org.strawberrymusicplayer.strawberry' >> strawberry-music
echo 'flatpak run org.strawberrymusicplayer.strawberry' >> strawberry-music-player
echo 'flatpak run org.strawberrymusicplayer.strawberry' >> Strawberry
else
echo 'Continuing!'
fi
echo 'Did you install Evolution Mail Client? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run org.gnome.Evolution' >> evolution
echo 'flatpak run org.gnome.Evolution' >> Evolution
echo 'flatpak run org.gnome.Evolution' >> gnome-mail
echo 'flatpak run org.gnome.Evolution' >> gnome-evolution
echo 'flatpak run org.gnome.Evolution' >> Gnome-Evolution
echo 'flatpak run org.gnome.Evolution' >> Gnome-mail
echo 'flatpak run org.gnome.Evolution' >> Gnome-evolution
else
echo 'Continuing!'
fi
echo 'flatpak run com.github.wwmm.easyeffects' >> easyeffects
echo 'flatpak run com.github.wwmm.easyeffects' >> pulseeffects
echo 'flatpak run com.github.wwmm.easyeffects' >> EasyEffects
echo 'Did you install Space Cadet Pinball? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run com.github.k4zmu2a.spacecadetpinball' >> spacecadetpinball
echo 'flatpak run com.github.k4zmu2a.spacecadetpinball' >> pinball
else
echo 'Continuing!'
fi
echo 'Did you install a Discord Client? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Vesktop or Armcord? ( 1 for Vesktop / 2 for Armcord )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run dev.Vencord.Vesktop' >> vesktop
echo 'flatpak run dev.Vencord.Vesktop' >> Vesktop
echo 'flatpak run dev.Vencord.Vesktop' >> discord
echo 'flatpak run dev.Vencord.Vesktop' >> Discord
else
echo 'flatpak run xyz.armcord.Armcord' >> armcord
echo 'flatpak run xyz.armcord.Armcord' >> Armcord
echo 'flatpak run xyz.armcord.Armcord' >> discord
echo 'flatpak run xyz.armcord.Armcord' >> Discord
fi
else
echo 'Continuing!'
fi
echo 'flatpak run org.videolan.VLC' >> vlc
echo 'flatpak run org.videolan.VLC' >> VLC
echo 'flatpak run com.github.tchx84.Flatseal' >> flatseal
echo 'Did you install Zoom? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run us.zoom.Zoom' >> zoom
else
echo 'Continuing!'
fi
echo 'Did you install Gnome Extension Manager? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'flatpak run com.mattjakeman.ExtensionManager' >> extension-manager
echo 'flatpak run com.mattjakeman.ExtensionManager' >> gnome-shell-extension-manager
echo 'flatpak run com.mattjakeman.ExtensionManager' >> gnome-shell-extensions-manager
echo 'flatpak run com.mattjakeman.ExtensionManager' >> gnome-extension-manager
else
echo 'Continuing!'
fi
echo 'flatpak run io.github.flattool.Warehouse' >> warehouse
echo 'flatpak run io.github.flattool.Warehouse' >> flattool-warehouse
echo 'flatpak run io.github.flattool.Warehouse' >> flattool
chmod +x *
cd /home/$USER/beezity-scripts
echo 'Flatpak shortcuts created!'
sleep 1
echo "Make sure to check the commands inside the bin folder using a terminal text-editor like (neo)vim or nano as 
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

clear
echo 'Install Catppuccin-Macchiato-Pink-Dark shell theme system-wide? ( 1 for yes / 2 for no )'
echo 'Heres what it shoud look like after you apply the themes in gnome-tweaks: (https://imgur.com/a/QPJd31q)'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y install rsync > /dev/null
cd /home/$USER/beezity-scripts
git clone https://github.com/MFactor1/AlpsCatppuccin.git
mkdir -p /home/$USER/.themes
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/.themes/* /home/$USER/.themes
cd /home/$USER/beezity-scripts
git clone https://github.com/vinceliuice/WhiteSur-icon-theme
cd WhiteSur-icon-theme
./install.sh
rm -rf /home/$USER/beezity-scripts/WhiteSur-icon-theme
# Checks if settings.ini exists
cat /home/$USER/.config/gtk-4.0/settings.ini && rm /home/$USER/.config/gtk-4.0/settings.ini &> /dev/null
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/gtk-4.0/ /home/$USER/.config/gtk-4.0
mkdir -p /home/$USER/.icons
mkdir -p /home/$USER/.fonts
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/.icons/* /home/$USER/.icons &> /dev/null
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/Fonts/* /home/$USER/.fonts &> /dev/null
cp -f /home/$USER/beezity-scripts/AlpsCatppuccin/Fonts/* /home/$USER/.fonts &> /dev/null
cp -f /home/$USER/beezity-scripts/AlpsCatppuccin/.icons/* /home/$USER/.icons &> /dev/null
rsync -av /home/$USER/beezity-scripts/AlpsCatppuccin/.icons/* /home/$USER/.icons &> /dev/null
rsync -av /home/$USER/beezity-scripts/AlpsCatppuccin/Fonts/* /home/$USER/.fonts &> /dev/null
sudo flatpak override --filesystem=~/.themes/
sudo flatpak override --filesystem=~/.icons/
sudo flatpak override --filesystem=xdg-config/gtk-4.0
cd /home/$USER/beezity-scripts
wget https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/configs/kitty.conf
mkdir -p /home/$USER/.config/kitty
mv -f /home/$USER/beezity-scripts/kitty.conf /home/$USER/.config/kitty/kitty.conf
echo 'Did you install Spotify via flatpak? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Do you want to install Spicetify and Catppuccin theme? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps
clear
echo 'Sorry, I cant manually do everything by myself...'
sleep 1
echo 'Heres what youll need to do...'
sleep 1
echo 'nano ~/.config/spicetify/config-xpui.ini'
sleep 3
echo 'Then append this path to the line that says prefs_path under settings.'
sleep 1
echo '/home/$USER/.var/app/com.spotify.Client/config/spotify/prefs'
sleep 1
echo 'Ill give you some time to take a screenshot and do this, just return to the terminal when youre done'
sleep 15
echo 'Answer for when you are done ( 1 for done ,No you dont get another option, you have to be done applying spicetify tweaks, Im not coding in an else. )'
read input
if [ "$input" -eq 1 ]
then
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/Themes/* /home/$USER/.config/spicetify/Themes
fi
fi
else
echo 'Continuing!'
fi
echo 'Do you want to copy the wallpapers? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
mkdir -p /home/$USER/Pictures/Wallpapers
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/wallpapers/*.jpg /home/$USER/Pictures/Wallpapers
mv -f /home/$USER/beezity-scripts/AlpsCatppuccin/wallpapers/*.png /home/$USER/Pictures/Wallpapers
echo 'Add all the pictures in your wallpaper folder in /home/$USER/Pictures!'
sleep 3
clear
echo 'Want to install an accompaying Catpuccin GRUB Theme? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
git clone https://github.com/catppuccin/grub.git && cd grub
sudo cp -r src/catppuccin-macchiato-grub-theme /usr/share/grub/themes/
sudo chown $USER /etc/default && sudo chown $USER /etc/default/grub
echo '# If you change this file, run "update-grub" afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n "Simple configuration"

GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
GRUB_THEME=GRUB_THEME="/usr/share/grub/themes/catppuccin-macchiato-grub-theme/theme.txt"

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command vbeinfo
# GRUB_GFXMODE=640x480

# Uncomment if you dont want GRUB to pass "root=UUID=xxx" parameter to Linux
# GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
# GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"' > /etc/default/grub
sudo chown root /etc/default && sudo chown root /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
else
echo 'Continuing!'
fi
else
echo 'Continuing!'
fi
echo 'Apply Open Bar Settings? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y install gnome-shell-extensions chrome-gnome-shell > /dev/null
clear
echo 'This is a manual process, I cant find anyway to automate it.'
sleep 1
echo 'Make sure you are using a chromium based browser like Edge or Brave'
sleep 1
echo 'Open this link: https://extensions.gnome.org/extension/6580/open-bar/'
sleep 1
echo 'And open this link too to install the GNOME shell extension:'
echo 'https://chromewebstore.google.com/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep'
sleep 1
echo 'Then install it'
sleep 1
echo 'Then open Gnome extensions (double tap the windows key and open extensions)'
sleep 1
echo 'Then open Open Bar Settings'
sleep 1
echo 'Then go to the bottom and look for Import / Export'
sleep 1
echo 'Then click Import and navigate to /home/$USER/beezity-scripts/AlpsCatppuccin/OpenBarSettings'
sleep 1
echo 'Then select BlueBeigeAlpsLineArt'
sleep 1
echo 'Ill give you a few seconds, return when youre done'
sleep 15
echo 'Are you done? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
echo 'Great, continuing!'
else
echo 'Dont just mindlessly mash away.'
echo 'Now ill give you 30 more seconds'
sleep 30
fi
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

clear
echo 'Do you want to install Hanabi live wallpaper? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Are you on Ubuntu 22.04 or Ubuntu 24.04? ( 1 for 22.04 / 2 for 24.04 )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER/beezity-scripts
git clone https://github.com/jeffshee/gnome-ext-hanabi.git -b legacy
sudo add-apt-repository multiverse -y
sudo apt-get -y update > /dev/null
clear
echo 'Installing build dependencies...'
sudo apt-get -y install meson libgtk-4-media-gstreamer ubuntu-restricted-extras gir1.2-gst-plugins-base-1.0 gir1.2-gst-plugins-bad-1.0 libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgtk-4-dev
git clone https://github.com/Rafostar/clapper.git
cd clapper
meson builddir --prefix=/usr/local
sudo meson install -C builddir
cd /home/$USER/beezity-scripts
cd gnome-ext-hanabi
./run.sh install
sleep 1
clear
echo 'After script is done, reboot and then head to Gnome Extensions and enable Hanabi and select the animated wallpaper you want in preferences.'
sleep 5
else
cd /home/$USER/beezity-scripts
git clone https://github.com/jeffshee/gnome-ext-hanabi.git
sudo apt-get -y install meson libgtk-4-media-gstreamer ubuntu-restricted-extras gir1.2-gst-plugins-base-1.0 gir1.2-gst-plugins-bad-1.0 libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgtk-4-dev
git clone https://github.com/Rafostar/clapper.git
cd clapper
meson builddir --prefix=/usr/local
sudo meson install -C builddir
cd /home/$USER/beezity-scripts
cd gnome-ext-hanabi
./run.sh install
sleep 1
clear
echo 'After script is done, reboot and then head to Gnome Extensions and enable Hanabi and select the animated wallpaper you want in preferences.'
sleep 5
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


echo 'Install Catpuccin-Macchiato-Dark shell theme and WhiteSur Icon Theme? ( 1 to install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER
wget https://github.com/sneepzity/beezity-scripts/raw/88ab7e613246e1267a43084d0c4ba7ca14055adc/Catppuccin-Dark-Macchiato-BL-MB.zip
sudo apt-get -y install unzip rsync > /dev/null
unzip Catppuccin-Dark-Macchiato-BL-MB.zip -d /home/$USER
mkdir -p /home/$USER/.themes
rsync -av /home/$USER/Catppuccin-Dark-Macchiato* /home/$USER/.themes
rm /home/$USER/.themes/Catppuccin-Dark-Macchiato-BL-MB.zip
rm -rf /home/$USER/Catppuccin*
rm /home/$USER/Catppuccin-Dark-Macchiato-BL-MB.zip
cd /home/$USER/beezity-scripts
git clone https://github.com/vinceliuice/WhiteSur-icon-theme
cd WhiteSur-icon-theme
./install.sh
rm -rf /home/$USER/beezity-scripts/WhiteSur-icon-theme
echo 'Successfully installed themes!'
echo 'Continuing!'
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

echo 'Apply light terminal customizations for kitty? (Dont install if you did the first Pink-Catppuccin theme) ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo apt-get -y update
sudo apt-get -y install unzip rsync fastfetch trash-cli > /dev/null
cd /home/$USER
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
mkdir -p "/home/$USER/JetBrainsMono Nerd Font"
unzip JetBrainsMono.zip -d "/home/$USER/JetBrainsMono Nerd Font"
mkdir -p /home/$USER/.fonts
rsync -av "/home/$USER/JetBrainsMono Nerd Font" /home/$USER/.fonts
rsync -av "/home/$USER/JetBrainsMono Nerd Font" /home/$USER/.local/share/fonts
rm -rf "/home/$USER/JetBrainsMono Nerd Font"
rm /home/$USER/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Ubuntu.zip
mkdir -p "/home/$USER/Ubuntu"
unzip Ubuntu.zip -d "/home/$USER/Ubuntu"
rsync -av "/home/$USER/Ubuntu" /home/$USER/.fonts
rsync -av "/home/$USER/Ubuntu" /home/$USER/.local/share/fonts
rm -rf /home/$USER/Ubuntu
rm /home/$USER/Ubuntu.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip
mkdir -p /home/$USER/UbuntuMono
unzip UbuntuMono.zip -d /home/$USER/UbuntuMono
rsync -av /home/$USER/UbuntuMono /home/$USER/.fonts
rsync -av /home/$USER/UbuntuMono /home/$USER/.local/share/fonts
rm -rf /home/$USER/UbuntuMono
rm /home/$USER/UbuntuMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuSans.zip
mkdir -p /home/$USER/UbuntuSans
unzip UbuntuSans.zip -d /home/$USER/UbuntuSans
rsync -av /home/$USER/UbuntuSans /home/$USER/.fonts
rsync -av /home/$USER/UbuntuSans /home/$USER/.loca/share/fonts
rm -rf /home/$USER/UbuntuSans
rm /home/$USER/UbuntuSans.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Noto.zip
mkdir -p /home/$USER/Noto
unzip Noto.zip -d /home/$USER/Noto
rsync -av /home/$USER/Noto /home/$USER/.fonts
rsync -av /home/$USER/Noto /home/$USER/.local/share/fonts
rm -rf /home/$USER/Noto
rm /home/$USER/Noto.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip
mkdir -p /home/$USER/NerdFontsSymbolsOnly
unzip NerdFontsSymbolsOnly.zip -d /home/$USER/NerdFontsSymbolsOnly
rsync -av /home/$USER/NerdFontsSymbolsOnly /home/$USER/.fonts
rsync -av /home/$USER/NerdFontsSymbolsOnly /home/$USER/.local/share/fonts
rm -rf /home/$USER/NerdFontsSymbolsOnly
rm NerdFontsSymbolsOnly.zip
sudo fc-cache -f -v
clear
fastfetch --gen-config
mkdir -p /home/$USER/.config/fastfetch
wget https://raw.githubusercontent.com/xerolinux/xero-layan-git/main/Configs/Home/.config/fastfetch/config.jsonc
mv -f config.jsonc /home/$USER/.config/fastfetch/config.jsonc
mkdir -p /home/$USER/.config/kitty
echo "background_opacity 0.7
background_blur 32
font_family      JetBrainsMono Nerd Font Mono
bold_font        JetBrainsMono Nerd Font Mono Extra Bold
bold_italic_font JetBrainsMono Nerd Font Mono Extra Bold Italic
tab_bar_min_tabs            1
tab_bar_edge                bottom
tab_bar_style               powerline
tab_powerline_style         slanted
tab_title_template          {title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}" > /home/$USER/.config/kitty/kitty.conf
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

echo 'Install Nala? (An APT alternative) ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
curl https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh | bash
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

echo 'Install Pacstall? [AUR for Ubuntu(-based)] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo bash -c "$(wget -q https://pacstall.dev/q/install -O -)"
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

echo 'Update all packages (Flatpak and APT)? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y update
sudo apt-get -y upgrade > /dev/null
sudo apt-get -y autoremove > /dev/null
flatpak update --assumeyes --noninteractive
sudo apt-get -y autoremove --purge > /dev/null
sudo apt-get -y --fix-broken install > /dev/null
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

echo 'Install rEFInd boot manager? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-add-repository ppa:rodsmith/refind -y
sudo apt-get update -y > /dev/null
sudo apt-get -y install refind
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

echo 'Install Simple Login Manager (SLiM)? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt install slim
sudo chown $USER /etc/slim.conf
echo '# Path, X server and arguments (if needed)
# Note: -xauth $authfile is automatically appended
#
default_path        /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
default_xserver     /usr/bin/X11/X
xserver_arguments   -nolisten tcp

# Commands for halt, login, etc.
halt_cmd            /sbin/shutdown -h now
reboot_cmd          /sbin/shutdown -r now
console_cmd         /usr/bin/xterm -C -fg white -bg black +sb -T "Console login" -e /bin/sh -c "/bin/cat /etc/issue.net; exec /bin/login"
#suspend_cmd        /usr/sbin/suspend

# Full path to the xauth binary
xauth_path         /usr/bin/X11/xauth

# Xauth file for server
authfile           /var/run/slim.auth


# Activate numlock when slim starts. Valid values: on|off
# numlock             on

# Hide the mouse cursor (note: does not work with some WMs).
# Valid values: true|false
hidecursor          false

# This command is executed after a succesful login.
# you can place the %session and %theme variables
# to handle launching of specific commands in .xinitrc
# depending of chosen session and slim theme
#
# NOTE: if your system does not have bash you need
# to adjust the command according to your preferred shell,
# i.e. for freebsd use:
# login_cmd           exec /bin/sh - ~/.xinitrc %session
login_cmd           exec /bin/bash -login /etc/X11/Xsession %session

# Commands executed when starting and exiting a session.
# They can be used for registering a X11 session with
# sessreg. You can use the %user variable
#
# sessionstart_cmd	some command
# sessionstop_cmd	some command

# Start in daemon mode. Valid values: yes | no
# Note that this can be overriden by the command line
# options "-d" and "-nodaemon"
# daemon	yes

# Set directory that contains the xsessions.
# slim reads xsesion from this directory, and be able to select.
sessiondir            /usr/share/xsessions/

# Executed when pressing F11 (requires scrot)
screenshot_cmd      scrot /root/slim.png

# welcome message. Available variables: %host, %domain
welcome_msg         Welcome to %host

# Session message. Prepended to the session name when pressing F1
# session_msg         Session: 

# shutdown / reboot messages
shutdown_msg       The system is halting...
reboot_msg         The system is rebooting...

# default user, leave blank or remove this line
# for avoid pre-loading the username.
#default_user        simone

# Focus the password field on start when default_user is set
# Set to "yes" to enable this feature
#focus_password      no

# Automatically login the default user (without entering
# the password. Set to "yes" to enable this feature
#auto_login          no


# current theme, use comma separated list to specify a set to 
# randomly choose from
#current_theme       debian-softwaves
current_theme bridge

# Lock file
lockfile            /var/run/slim.lock

# Log file
logfile             /var/log/slim.log' > /etc/slim.conf
git clone https://github.com/adi1090x/slim_themes.git
sudo chown $USER /usr/share/slim/themes
mv -f slim_themes/themes/bridge /usr/share/slim/themes
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

echo 'Would you like to reboot now or later? (1 for now / 2 for later)'
read input
if [ "$input" -eq 1 ]
then
reboot
else
echo 'Make sure to reboot later to apply changes!'
fi

exit
fi
