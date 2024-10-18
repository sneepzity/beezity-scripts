#!/bin/bash

echo "
Debloat Linux Mint? (1/2)"
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
  sudo apt-get purge redshift -y
	sudo apt-get purge libreoffice-core -y
	sudo apt-get purge libreoffice-common -y
	sudo apt-get purge transmission-gtk -y
	sudo apt-get purge hexchat -y
	sudo apt-get purge baobab -y
	sudo apt-get purge seahorse -y
	sudo apt-get purge thunderbird -y
	sudo apt-get purge rhythmbox -y
	sudo apt-get purge pix -y
	sudo apt-get purge simple-scan -y
	sudo apt-get purge drawing -y
	sudo apt-get purge gnote -y
	sudo apt-get purge xreader -y
	sudo apt-get purge onboard -y
	sudo apt-get purge gnome-calendar -y
  sudo apt-get purge celluloid -y
	sudo apt-get purge gnome-logs -y
	sudo apt-get purge gnome-power-manager -y
	sudo apt-get purge onboard -y
	sudo apt-get-get purge warpinator -y
