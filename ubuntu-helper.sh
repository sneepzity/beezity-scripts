#!/bin/bash

echo 'Ubuntu helper script, so you dont have to clone the whole repo'
sleep 3
clear

echo 'Now are you gonna use ubuntu or ubuntu-beezity? ( 1 for ubuntu / 2 for ubuntu-beezity )'
read input

if [ "$input" -eq 1 ]; then
    sudo apt-get -y install curl > /dev/null
    mkdir -p /home/$USER/beezity-scripts && cd /home/$USER/beezity-scripts
    curl -sSL https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu.sh | bash
    exit
elif [ "$input" -eq 2 ]; then
    sudo apt-get -y install curl > /dev/null
    mkdir -p /home/$USER/beezity-scripts && cd /home/$USER/beezity-scripts
    curl -sSL https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu-beezity.sh | bash
    exit
else
    echo "Invalid input. Please enter 1 or 2."
fi

exit
