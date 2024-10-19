#!/bin/bash

echo 'This script is for Ubuntu 22.04+ ONLY. 
Make sure to read all scripts you download before executing them, 
especially ones running as root.'

echo 'Waiting 5 seconds...'
sleep 5

echo '
Install basic apps? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then

# You can comment out using # and make sure to know what you're doing before hand!

# This installs basic requirements for most of the other commands like build-essential, wget and curl
echo 'Installing basic requirements...'
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

# This creates keyrings for brave, wine and other future applications
echo 'Now creating GPG keyring...'
sleep 2
sudo mkdir -pm755 /etc/apt/keyrings > /dev/null
echo 'GPG keyring successfully added!'
sleep 2

# The four commands below install brave browser, comment it out if you don't want to install brave
echo '
Install brave browser? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now installing brave browser...'
sleep 2
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg 
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update -y > /dev/null
sudo apt-get install -y brave-browser > /dev/null
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

# All the snap related commands down below uninstall firefox snap and snap store
# It also puts higher preference on non-snap

echo 'Updating and upgrading packages...'
sudo apt-get update -y > /dev/null
sudo apt-get upgrade -y > /dev/null
echo 'Removing snap firefox and store...'
sudo snap remove --purge firefox > /dev/null
sudo snap remove --purge snap-store > /dev/null
printf "Package: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1" > /etc/apt/preferences.d/firefox-no-snap
printf "Package: snapd\nPin: release a=*\nPin-Priority: -10" > /etc/apt/preferences.d/nosnap.pref
echo 'Snapped in half!'


# This automatically adds the universe and multiverse repos to access as much software as possible, again comment out if you don't want
# Also upgrades all packages possible, dont mind if a few are held back, thats really due to Ubuntu and can't be fought against
echo 'Add universe and multiverse software repositories for software? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now adding official Ubuntu software repositories...'
sleep 2
sudo apt-get update -y > /dev/null
sudo apt-get upgrade -y > /dev/null
sudo apt-add-repository universe -y > /dev/null
sudo apt-get update -y > /dev/null
sudo apt-add-repository multiverse -y > /dev/null
sudo apt-get update -y > /dev/null
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
echo "
Install latest wine32 and wine64 stable for Ubuntu 22.04/24.04? ( 1 for 22.04 / 2 for 24.04 / 3 for quit or continue )"
read input
if [ "$input" -eq 1 ]
then
sudo dpkg --add-architecture i386
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
echo 'Now installing wine...'
sleep 2
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt-get update -y > /dev/null
sudo apt-get install -y --install-recommends winehq-stable wine-stable wine-stable-amd64 wine-stable-i386:i386 > /dev/null
echo 'Wine installed!'
fi
if [ "$input" -eq 2 ]
then
clear
echo 'READ READ READ ( 1 for install / 2 for no ) Did you just accidentally not read and go straight for 2,'
echo 'or are you on Ubuntu 24.04 and actually want to install wine? READ READ READ'
echo 'Sleeping 2, wait a moment and read.'
sleep 2
read input
if [ "$input" -eq 1 ] 
then
sudo dpkg --add-architecture i386
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
echo 'Installing wine...'
sleep 2
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
sudo apt-get update -y > /dev/null
sudo apt-get install -y --install-recommends winehq-stable wine-stable wine-stable-amd64 wine-stable-i386:i386 > /dev/null
echo 'Wine installed!'
else
echo 'Continuing!'
fi
echo 'Quit or continue? ( 3 for QUIT / 4 for CONTINUE )'
if [ "$input" -eq 3 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi
fi

# This installs the regular debian package version of Firefox which is much faster than the one in Ubuntu by default.

echo 'Install Firefox Deb? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo 'Now installing firefox...'
sudo apt-get update -y > /dev/null
sudo apt-get install firefox -y > /dev/null
echo 'Firefox deb version installed!'
else
echo 'Continuing!'
fi

# This installs flatpak, a much better alternative to snap with much wider app support and compatibility
echo 'Install flatpak and flathub? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now installing flatpak and flathub..'
sleep 2
sudo apt-get install -y flatpak > /dev/null
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sleep 3
echo 'Flatpak installed and flathub set-up!'
echo 'Make sure to reboot LATER to apply all changes!'
sleep 3
else
echo 'Continuing!'
fi

echo 'Install kitty terminal and change shell to Zsh with p10k theme? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Now installing kitty, zsh and p10k...'
sudo apt-get install -y zsh kitty > /dev/null
chsh -s /usr/bin/zsh
echo 'Make sure to log out and log back LATER in to apply changes'
sleep 2
# The next few commands below clone the latest release of p10k and add it to zshrc file and restart shell to let it apply
# Fonts may be broken, you may want to use something like JetbrainMonoNerd font in gnome-terminal or kitty
cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k > /dev/null
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
$SHELL
echo 'You have to manually install fonts if you use Gnome Terminal :('
echo 'Dont worry if the script freezes because I have it set to sleep for a few seconds :)'
sleep 3
echo "IF you use kitty, then you can edit ~/.config/kitty/kitty.conf and search up how to add fonts 
(https://reddit.com/r/KittyTerminal/comments/11qexp6/how_to_use_my_own_custom_font/)"
sleep 3
else
echo 'Continuing!'
fi

echo 'Make Ubuntu faster? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
# Preload loads commonly used apps into RAM and apt-fast uses parallel (multiple) downloads to make apt faster
# Also removing a few useless applications like thunderbird, libreoffice, vim (sorry vim users) and the gnome games
then
echo 'Now installing apt-fast, preload and removing unnecessary bloat...'
sudo apt-add-repository ppa:apt-fast/stable -y > /dev/null
sudo apt-get update -y > /dev/null
sudo apt-get install -y preload > /dev/null
sudo apt-get install -y apt-fast
echo 'Apt-fast and preload installed!'
sudo apt-get remove -y --purge *thunderbird* *libreoffice* *vim* aisleriot gnome-mahjongg gnome-mines gnome-sudoku brltty duplicity empathy empathy-common example-content gnome-accessibility-themes gnome-contacts gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects landscape-common libsane python3-uno rhythmbox* sane-utils shotwell* telepathy* totem*  printer-driver-brlaser printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-m2300w printer-driver-ptouch  printer-driver-splix
sudo apt-get autoremove -y > /dev/null
echo 'Debloat successful, enjoy your new distro!'
else
echo 'Thanks for looking at my scripts!'
fi
fi

exit
