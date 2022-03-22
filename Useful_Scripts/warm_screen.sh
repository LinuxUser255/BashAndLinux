#!/usr/bin/env bash

# first install redshift: sudo apt install redshift
# Use the redshift command to instantly adjust the color warmth of your screen.
# This reduces the blue light that can strain your eyes over proloneged exposure/screen time.
# You can rename this scrip to something short, remove the .sh extension, and move it to /usr/bin
# Now, you can execute it no matter where you are in the terminal.
# I renamed mine r so now all I do is hit the letter r, then hit enter, and this script is running.

echo ''
echo -e "Redshift: ON 1. OFF 2.\n1 = ON\n2 = Off\n"
read sel

# Turn ON Redshift
if [[ $sel -eq 1 ]]
then
redshift -O 4700K

# Turn OFF Redshift
elif [[ $sel -eq 2 ]]
then
redshift -x

echo ''

fi
