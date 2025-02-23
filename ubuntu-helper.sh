#!/bin/bash

echo 'Ubuntu helper script, so you dont have to clone the whole repo'
sleep 3
clear

echo 'Now are you gonna use ubuntu or ubuntu-beezity? ( 1 for ubuntu / 2 for ubuntu-beezity )'
read input

# Check if input is a valid integer
if [[ ! "$input" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter 1 or 2."
    exit 1
fi

if [ "$input" -eq 1 ]; then
    sudo apt-get -y install curl > /dev/null
    mkdir -p /home/$USER/beezity-scripts && cd /home/$USER/beezity-scripts
    curl -sSL https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu.sh -o ubuntu.sh
    chmod +x ubuntu.sh
    ./ubuntu.sh
elif [ "$input" -eq 2 ]; then
    sudo apt-get -y install curl > /dev/null
    mkdir -p /home/$USER/beezity-scripts && cd /home/$USER/beezity-scripts
    curl -sSL https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu-beezity.sh -o ubuntu-beezity.sh
    chmod +x ubuntu-beezity.sh
    ./ubuntu-beezity.sh
else
    echo "Invalid input. Please enter 1 or 2."
    exit 1
fi
