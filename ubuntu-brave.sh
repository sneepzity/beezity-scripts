#!/bin/bash

echo 'question? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo 'Installing brave browser...'
sudo apt-get install -y curl > /dev/null
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update -y > /dev/null
sudo apt-get install -y brave-browser > /dev/null
else
echo "Thanks for looking at my scripts!"
fi

exit
