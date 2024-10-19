#!/bin/bash

echo 'x?' ( 1 for yes / 2 for no )
read input
if [ "$input" -eq 1 ]
then
command
else
# echo 'Continuing!' 
# echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
# read input
# if [ "$input" -eq 1 ]
# then
# echo 'Thanks for looking at my scripts!'
# exit
# else
# echo 'Continuing!'
# fi
fi

echo 'x?' ( 1 for yes / 2 for no )
read input
if [ "$input" -eq 1 ]
then
command
else
# command 2
fi

echo 'x?' ( 1 for yes / 2 for no )
read input
if [ "$input" -eq 1 ]
then
command
else
echo 'Continuing!' 
fi

echo 'x?' ( 1 for yes / 2 for no )
read input
if [ "$input" -eq 1 ]
then
command
else
echo 'Do you want to leave? ( 1 to leave / 2 to continue )'
read input
if [ "$input" -eq 1 ]
then
echo 'Thanks for looking at my scripts!'
exit
else
echo 'Continuing!'
fi
fi
