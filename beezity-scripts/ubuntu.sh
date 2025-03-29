#!/bin/bash

if [ "$(whoami)" = "root" ] 
then
        echo "Please run this script as non-root (./ubuntu.sh)."
        exit
fi

clear

echo 'Checking working directory...'
current_directory=$(pwd)
if [ "$current_directory" = "/home/$USER/beezity-scripts" ]
then
echo 'Great, continuing.'
else
echo 'Clone the repo to your home directory, you can clean it up afterwards.'
exit
fi

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
Make sure to read all scripts you download before executing them, 
especially ones asking for root.'

sleep 3

echo 'Waiting 5 seconds...'
sleep 5

echo 'Did you select a new ubuntu server/mirror for packages? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y update > /dev/null
else
echo 'Continuing!'
fi

echo '
Install basic requirements? ( 1 to install / 2 for already installed )'
read input
if [ "$input" -eq 1 ]
then

# You can comment out using # and make sure to know what you're doing before hand!

# This installs basic requirements for most of the other commands like build-essential, wget and curl
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

echo '
Replace Pulseaudio with Pipewire [recommended]? ( 1 to install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt install pipewire-media-session- wireplumber > /dev/null
systemctl --user --now enable wireplumber.service > /dev/null
sudo apt install pipewire-audio-client-libraries > /dev/null
sudo cp /usr/share/doc/pipewire/examples/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/
sudo chmod 644 /etc/alsa/conf.d/99-pipewire-default.conf
sudo apt install libldacbt-{abr,enc}2 libspa-0.2-bluetooth pulseaudio-module-bluetooth- > /dev/null
sudo cp -r /var/lib/bluetooth /var/lib/bluetooth_BACKUP
sudo systemctl stop bluetooth > /dev/null
sudo rm -rf /var/lib/bluetooth/*
sudo systemctl start bluetooth > /dev/null
sudo echo "Experimental=true" >> /etc/bluetooth/main.conf
sudo echo "--experimental exec option" >> /lib/systemd/system/bluetooth.service
sudo systemctl daemon-reload
sudo systemctl restart bluetooth
echo '
Add extra bluetooth codecs? [recommended if you use bluetooth audio devices] ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-add-repository universe -y > /dev/null
sudo apt-add-repository multiverse -y > /dev/null
sudo apt update -y > /dev/null
sudo apt upgrade -y > /dev/null
sudo add-apt-repository ppa:aglasgall/pipewire-extra-bt-codecs -y >/dev/null
sudo apt update -y > /dev/null
sudo apt upgrade -y > /dev/null
else
echo 'Continuing!'
fi
sudo touch /usr/share/pipewire/media-session.d/with-pulseaudio
systemctl --user restart wireplumber
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


# This creates keyrings for brave, wine and other future applications
#echo 'Create GPG keyring for Brave and Wine? ( 1 for yes / 2 for no )'
#read input
#if [ "$input" -eq 1 ]
#then
#echo 'Now creating GPG keyring...'
#sleep 2
#sudo mkdir -pm755 /etc/apt/keyrings > /dev/null
#echo 'GPG keyring successfully added!'
#sleep 2
#else
#echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
#read input
#if [ "$input" -eq 1 ]
#then
#echo 'Thanks for looking at my scripts!'
#exit
#else
#echo 'Continuing!'
#fi
#fi

# The four commands below install brave browser, comment it out if you don't want to install brave // later beezity, figured out how to use 1 and 2 like it was my only choice
echo '
Install brave browser? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now installing brave browser...'
sleep 2
curl -fsS https://dl.brave.com/install.sh | sh
echo 'Brave installed!'
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

# All the snap related commands down below uninstall firefox snap and snap store
# It also puts higher preference on non-snap

echo 'Remove thunderbird, firefox, snap store and upgrade and update packages? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Updating and upgrading packages...'
sudo apt-get update -y > /dev/null
sudo apt-get upgrade -y > /dev/null
echo 'Removing snap firefox and store...'
pkill firefox
sudo snap remove --purge thunderbird > /dev/null
sudo snap remove --purge firefox > /dev/null
sudo snap remove --purge snap-store > /dev/null
cd /home/$USER
sudo touch /etc/apt/preferences.d/firefox-no-snap
sudo touch /etc/apt/preferences.d/nosnap.pref
sudo chown $USER /etc/apt/preferences.d/firefox-no-snap
sudo chown $USER /etc/apt/preferences.d/nosnap.pref
printf "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1" > /etc/apt/preferences.d/firefox-no-snap
printf "Package: snapd\nPin: release a=*\nPin-Priority: -10" > /etc/apt/preferences.d/nosnap.pref
sudo apt-get -y update > /dev/null
echo 'Snapped in half!'
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


# This automatically adds the universe and multiverse repos to access as much software as possible, again comment out if you don't want
# Also upgrades all packages possible, dont mind if a few are held back, thats really due to Ubuntu and can't be fought against
echo 'Add universe and multiverse software repositories for software? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now adding official Ubuntu software repositories...'
sleep 2
sudo apt-get update 
sudo apt-get upgrade -y > /dev/null
sudo apt-add-repository universe -y > /dev/null
sudo apt-get update -y 
sudo apt-add-repository multiverse -y > /dev/null
sudo apt-get update -y 
sudo apt-get upgrade -y > /dev/null
echo 'Universe and multiverse repository added!'
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

# This adds 32-bit architecture as by default Ubuntu only supports 64-bit, it also installs wine-stable,
# change packages or comment out if you don't like the default selection here
#echo "
#Install latest wine32 and wine64 stable for Ubuntu 22.04/24.04? ( 1 for 22.04 / 2 for 24.04 / 3 for quit or continue )"
#echo 'Warning! This may take quite a while to install depending on your bandwidth/data cap'
#sleep 3
#read input
#if [ "$input" -eq 1 ]
#then
#sudo dpkg --add-architecture i386
#sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
#echo 'Now installing wine...'
#sleep 2
#sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
#sudo apt-get update -y 
#sudo apt-get install -y --install-recommends winehq-stable wine-stable wine-stable-amd64 wine-stable-i386:i386 > /dev/null
#echo 'Wine installed!'
#fi
#if [ "$input" -eq 2 ]
#then
#clear
#echo 'READ READ READ ( 1 for install / 2 for no ) Did you just accidentally not read and go straight for 2,'
#echo 'or are you on Ubuntu 24.04 and actually want to install wine? READ READ READ'
#echo 'Sleeping 2, wait a moment and read.'
#sleep 2
#read input
#if [ "$input" -eq 1 ] 
#then
#sudo dpkg --add-architecture i386
#sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
#sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
#clear
#echo 'Installing wine...'
#sleep 2
#sudo apt-get -y upgrade > /dev/null
#sudo apt-get update -y > /dev/null
#sudo apt-get -y install wine > /dev/null
# Commented out until further notice 
# sudo apt-get install -y --install-recommends winehq-stable wine-stable wine-stable-amd64 wine-stable-i386:i386 > /dev/null
#echo 'Wine installed!'
#else
#echo 'Continuing!'
#fi
#echo 'Quit or continue? ( 3 for QUIT / 4 for CONTINUE )'
#read input
#if [ "$input" -eq 3 ]
#then
#echo 'Thanks for looking at my scripts!'
#exit
#else
#echo 'Continuing!'
#fi
#fi

# This installs the regular debian package version of Firefox/Thunderbird which is much faster than the one in Ubuntu by default.

echo 'Install Thunderbird Deb? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo apt-get update -y > /dev/null
sudo apt-get upgrade -y > /dev/null
sudo apt-get install thunderbird > /dev/null
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

echo 'Install Zen Browser from Flathub? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get install -y flatpak gnome-software-plugin-flatpak > /dev/null
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --assumeyes --noninteractive app.zen_browser.zen
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

echo 'Install Firefox Deb? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000

Package: firefox*
Pin: release o=Ubuntu
Pin-Priority: -1' | sudo tee /etc/apt/preferences.d/mozilla
echo 'Now installing firefox...'
sudo apt-get update -y > /dev/null
sudo apt-get -y remove --purge firefox > /dev/null
sudo apt-get install firefox -y --allow-downgrades > /dev/null
echo 'Firefox deb version installed!'
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

# This installs flatpak, a much better alternative to snap with much wider app support and compatibility
echo 'Install flatpak and flathub? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now installing flatpak and flathub..'
sleep 2
sudo apt-get install -y flatpak gnome-software-plugin-flatpak > /dev/null
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sleep 3
echo 'Flatpak installed and flathub set-up!'
echo 'Make sure to reboot LATER to apply all changes!'
sleep 3
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

echo 'Install kitty terminal and Zsh? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now installing kitty and zsh...'
sudo apt-get install -y zsh kitty > /dev/null
echo 'Do you want to switch to Zsh? ( 1 for yes / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
chsh -s /usr/bin/zsh
echo 'Make sure to log out and log back LATER in to apply changes'
sleep 2
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

echo 'Make Ubuntu faster? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
# Preload loads commonly used apps into RAM and apt-fast uses parallel (multiple) downloads to make apt faster
# Also removing a few useless applications like thunderbird, libreoffice, vim (sorry vim users) and the gnome games
then
echo 'Now installing apt-fast, preload and removing unnecessary bloat...'
sudo apt-add-repository ppa:apt-fast/stable -y > /dev/null
sudo apt-get update -y
sudo apt-get install -y preload > /dev/null
sudo apt-get install -y apt-fast
echo 'Apt-fast and preload installed!'
sudo apt-get remove -y --purge *thunderbird* *libreoffice* *vim* aisleriot gnome-mahjongg gnome-mines gnome-sudoku brltty duplicity empathy empathy-common example-content gnome-accessibility-themes gnome-contacts gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects landscape-common libsane python3-uno rhythmbox* sane-utils shotwell* telepathy* totem*  printer-driver-brlaser printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-m2300w printer-driver-ptouch  printer-driver-splix
sudo apt-get autoremove -y > /dev/null
sudo chown $USER /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
echo '[connection]
wifi.powersave = 2' > /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
sudo chown root /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
sudo touch /etc/apt/apt.conf.d/00aptitude
sudo chown $USER /etc/apt/apt.conf.d/00aptitude
sudo chown $USER /etc/sysctl.conf
echo 'Acquire::Languages "none";' >> /etc/apt/apt.conf.d/00aptitude
echo 'vm.swappiness=30' >> /etc/sysctl.conf
sudo chown root /etc/sysctl.conf
sudo chown root /etc/apt/apt.conf.d/00aptitude
echo 'Use atheros wifi? ( 1 for yes / 2 for no)'
read input
if [ "$input" -eq 1 ]
then
sudo touch /etc/modprobe.d/ath9k.conf
sudo chown $USER /etc/modprobe.d/ath9k.conf
echo "options ath9k nohwcrypt=1" >> /etc/modprobe.d/ath9k.conf
sudo chown root /etc/modprobe.d/ath9k.conf
else
echo 'Continuing!'
fi
echo 'Debloat successful, enjoy your new distro!'
else
echo 'Thanks for looking at my scripts!'
exit
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
