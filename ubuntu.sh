#!/bin/bash

echo "This script is for Ubuntu 22.04 (MINIMAL) ONLY. Make sure to read all scripts you download before executing them, especially ones running as root."
if [ "$(whoami)" != "root" ]; then
	echo "Please run this script as root (sudo su or sudo ./ubuntu.sh)."
	exit
fi

echo "
Install basic apps? (1/2)"
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then

# You can comment out using # and make sure to know what you're doing before hand!

# This installs basic requirements for most of the other commands like build-essential, wget and curl

sudo apt install -y curl build-essential wget

# This creates keyrings for brave, wine and other future applications

sudo mkdir -pm755 /etc/apt/keyrings

# The four commands below install brave browser, comment it out if you don't want to install brave

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# All the snap related commands down below uninstall firefox snap and snap store and disables snap
# It also puts higher preference on non-snap

printf "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1" > /etc/apt/preferences.d/firefox-no-snap
printf "Package: snapd\nPin: release a=*\nPin-Priority: -10" > /etc/apt/preferences.d/nosnap.pref
sudo apt-get upgrade -y
snap remove --purge firefox snap-store
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service

# This automatically adds the universe and multiverse repos to access as much software as possible, again comment out if you don't want
# Also upgrades all packages possible, dont mind if a few are held back, thats really due to Ubuntu and can't be fought against

sudo apt update -y
sudo apt-get upgrade -y
sudo apt-add-repository universe -y
sudo apt update -y
sudo apt-add-repository multiverse -y
sudo apt update -y
sudo apt upgrade -y

# This adds 32-bit architecture as by default Ubuntu only supports 64-bit, it also installs wine-stable,
# change packages or comment out if you don't like the default selection here

sudo dpkg --add-architecture i386
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt install -y --install-recommends winehq-stable wine-stable wine-stable-amd64 wine-stable-i386:i386

# This installs the regular debian package version of Firefox which is much faster than the one in Ubuntu by default.

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# This installs flatpak, a much better alternative to snap with much wider app support and compatibility

sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sleep 3
echo 'Make sure to reboot LATER to apply all changes!'
else
echo 'Thanks for looking at my scripts!'
fi

echo 'Install kitty terminal and change shell to Zsh with p10k theme? (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
sudo apt install zsh kitty
chsh -s /usr/bin/zsh
echo 'Make sure to log out and log back LATER in to apply changes'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
echo 'You have to manually install fonts if you use Gnome Terminal :('
echo 'Dont worry if the script freezes because I have it set to sleep for a few seconds :)'
sleep 3
echo 'IF you use kitty, then you can edit ~/.config/kitty/kitty.conf and search up how to add fonts (https://reddit.com/r/KittyTerminal/comments/11qexp6/how_to_use_my_own_custom_font/)"'
sleep 5
else
echo 'Thanks for looking at my scripts!'
fi

echo 'Make Ubuntu faster? (1/2)'
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
# Preload loads commonly used apps into RAM and apt-fast uses parallel (multiple) downloads to make apt faster
# Also removing a few useless applications like thunderbird, libreoffice, vim (sorry vim users) and the gnome games
then
sudo apt-add-repository ppa:apt-fast/stable -y
sudo apt update -y 
sudo apt install -y preload apt-fast
sudo apt remove *thunderbird* *libreoffice* *vim* aisleriot gnome-mahjongg gnome-mines gnome-sudoku  brltty duplicity empathy empathy-common example-content gnome-accessibility-themes gnome-contacts gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects landscape-common libsane libsane-common python3-uno rhythmbox* sane-utils shotwell* telepathy* totem*  printer-driver-brlaser printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-m2300w printer-driver-ptouch  printer-driver-splix # This may not work, subject to change
else
echo 'Thanks for looking at my scripts!'
fi

exit





