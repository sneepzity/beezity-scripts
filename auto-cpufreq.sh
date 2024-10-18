#!/bin/bash

echo "This script installs auto-cpufreq on your system."

echo "
Install auto-cpufreq? ( 1 for install / 2 for no )"
read input
if [ "$input" -eq 1 ]
then
cd ~
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
fi

exit
