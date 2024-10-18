#!/bin/bash

echo 'question? ( 1 for install / 2 for no )'
read input
if [ "$input" -eq 1 ]
then
echo "working"
else
echo "Thanks for looking at my scripts!"
fi

exit
