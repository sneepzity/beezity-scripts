#!/bin/bash

echo 'Ubuntu helper script, so you dont have to clone the whole repo'
sleep 1
clear

echo 'Now are you gonna use ubuntu or ubuntu-beezity? ( 1 for ubuntu / 2 for ubuntu-beezity )'
read input
if [ "$input" -eq 1 ]
then
cd /home/$USER
mkdir -p /home/$USER/beezity-scripts
cd beezity-scripts
wget https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu.sh
chmod +x *.sh
./ubuntu.sh
else
cd /home/$USER
mkdir -p /home/$USER/beezity-scripts
cd beezity-scripts
wget https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu-beezity.sh
chmod +x *.sh
./ubuntu-beezity.sh
fi

exit