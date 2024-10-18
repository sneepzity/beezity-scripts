#!/bin/bash

echo "This script installs auto-cpufreq on your system."

echo "
Install auto-cpufreq? (1/2)"
read input
if [ "$input" -gt 0 -a "$input" -lt 2 ]
then
cd ~
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
fi

exit
