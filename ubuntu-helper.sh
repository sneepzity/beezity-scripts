#!/bin/bash

echo 'Ubuntu or Ubuntu-beezity? ( 1 for ubuntu / 2 for ubuntu-beezity )'
read input
if [ "$input" -eq 1 ]
then
sudo apt-get -y install curl > /dev/null
wget https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu.sh
chmod +x ubuntu.sh
mkdir /home/$USER/beezity-scripts
mv ubuntu.sh /home/$USER/beezity-scripts
./ubuntu.sh
else
sudo apt-get -y install curl > /dev/null
wget https://raw.githubusercontent.com/sneepzity/beezity-scripts/refs/heads/main/ubuntu-beezity.sh
chmod +x ubuntu-beezity.sh
mkdir /home/$USER/beezity-scripts
mv ubuntu-beezity.sh /home/$USER/beezity-scripts
./ubuntu-beezity.sh
fi

exit
