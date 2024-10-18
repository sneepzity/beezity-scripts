#!/bin/bash

echo "
Install JaKooLit's Hyprland Config? [https://github.com/JaKooLit/Ubuntu-Hyprland/tree/24.04] ( 1 for install / 2 for no )"
read input
if [ "$input" -eq 1 ]
then
git clone -b 24.04 --depth 1 https://github.com/JaKooLit/Ubuntu-Hyprland.git ~/Ubuntu-Hyprland-24.04
cd ~/Ubuntu-Hyprland-24.04
chmod +x install.sh
./install.sh
else
echo 'Thanks for looking at my scripts!'
fi

exit
