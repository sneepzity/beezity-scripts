# beezity-scripts
Very poor bash scripts

this is made specifically in mind for linux, not windows or wsl, don't try it on them

clone repo:
git clone https://github.com/sneepzity/beezity-scripts

cd beezity-scripts

chmod +x *.sh

sh (script).sh or sudo ./(script).sh



i don't guarantee in anyway that the scripts even work, i just made them in my free time

i might also host a few other files here for my sake

to be added:
none for now

to be done:
none for now

i might also include other tweaks from other repos

# EACH SCRIPT


this section is to describe what each script does before you run it

# ubuntu.sh / ubuntu-24.04.sh


This script can do the following:
Installs: (First part)
Basic apps:
curl - url download
wget - url download
build-essential - essential packages for developing and building files and apps
firefox - non-snap version straight from mozilla
brave browser - arguably best up to date and widely supported chromium browser but is very decisive
wine32 and wine64 - allows you to run windows apps
flatpak - distro agnostic package manager with a wide choice of exclusive software
Terminal: (Second part)
zsh - alternative to bash
kitty - better alternative to gnome-terminal
Faster Ubuntu: (Last part)
apt-fast - uses aria2 to do parallel downloading with apt, apt-get or aptitude
preload - loads commonly used apps into ram allowing them to open faster
Disables:
snap firefox (uninstall)
snap store (uninstall)
snaps (but does not outright uninstall the service)
Removes:
Ubuntu bloat (gnome games, libreoffice, thunderbird etc.)

# ubuntu-beezity.sh / ubuntu-beezity-24.04.sh


This script can do the following
# Installs:


Playonlinux -  software for multiple patched windows software making it easier to install apps like MS Office
Ncspot - terminal version of spotify
space cadet pinball - recompiled for linux
vesktop - discord + vencord patches and other qol features baked right in
VLC - good video player
vs code - coding
flatseal - flatpak permission manager
zoom - conferencing app
extension manager - gnome extension manager (better than the apt one)
sober - linux implementation of android roblox
flattool warehouse - flatpak management (more general than flatseal)
gnome-tweaks - gnome tweaks app to apply multiple quick changes
gnome-shell-extensions - allows extensions to be used
chrome-gnome-shell - integration with chromium based browsers
cubic - custom ubuntu iso creator (also works on debian, debian-based and ubuntu-based as long as they don't stray too far off)
gamemode - custom script to increase game performance (https://github.com/FeralInteractive/gamemode)
Removes:
snaps (fully removes them, gone from the system, even the leftover folders)
# Settings:


sets gnome to dark mode
sets ubuntu to performance mode
sets ubuntu to not have idle-dim
sets ubuntu to only turn off screen after 12 hours
sets ubuntu to turn off mouse acceleration
sets ubuntu to show seconds in the top bar clock


# Flatpak
it sets all of them to have a terminal shortcut meaning:
you can type a name and have it open in a gui or terminal without having to type flatpak run app every single time
do ls ~/bin 
to see all app names



# arch-beezity.sh
Installs:
kitty - terminal
base-devel - required for lots of different packages
networkmanager - easier network connecting
bluez-utils - bluetooth
yay - aur package manager
nautilus - file manager
brave-bin - brave browser
flatpak - flatpak integration in arch
Ncspot - terminal version of spotify
space cadet pinball - recompiled for linux
vesktop - discord + vencord patches and other qol features baked right in
VLC - good video player
vs code - coding
flatseal - flatpak permission manager
zoom - conferencing app
extension manager - gnome extension manager (better than the apt one)
sober - linux implementation of android roblox
flattool warehouse - flatpak management (more general than flatseal)

also creates the same aliases as in ubuntu-beezity.sh allowing you to launch the flatpak apps from terminal
not use them, just launch them you'll still need a display compositor in order to display them except ncspot
ls ~/bin
to see all app names


# auto-cpufreq.sh
this pulls the latest version of auto-cpufreq from their git repository
works on every linux distro as it isn't tied to  a specific distro package


# ubuntu-24.04-jakoolit-hyprland.sh

this is just a shortcut to install his version of hyprland
runs the same commands straight from the repo
only works on 24.04 due to outdated packages on everything before

# linux-mint-22.sh

still a heavy work in progress but aims to
remove extra packages added by default
install necessary applications like flatpak and
bring a cleaner experience to linux mint instead of being feature complete linux mint

