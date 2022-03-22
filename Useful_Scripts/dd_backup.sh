#!/usr/bin/env bash

echo '! READ COMMENTS before executing the script!'
echo ' ! Hit Control  c to exit !'
# Flash OS and all data to an external hard drive.
# Comment out all lines but 22 if you plan to automate backups via crontab.
# Leave as is to run script manualy. 
# Important. Identify and confirm the device to which you ae writing data, 
# otherwise you could inadvertently erase the wrong drive.
# This example assumes the device to write to is /dev/sdb

echo ' '
echo -e " Run lsblk first? Hit 1 for Yes. Hit 2 for No: \n1 yes\n2 no\n"
read sel

# You could also run fdisk -l for extra confirmation and info
# More options could be added to this script such as: Run fdisk -l (yes or no)
# Maybe a while loop, a variable/place holder for the device's name  /dev/sd $DEVICE_NAME
# Give an option to type in the device's name, /dev/sdb , sdc, etc..
# And, add a confirmation of the device you chose and a selection to run the script now, or cancel.

# Hit 1 for lsblk.
if [[ $sel -eq 1 ]]; 
then
lsblk
echo ''

# Hit 2 for no.
elif [[ $sel -eq 2 ]];
then
true

fi

# I've commented out the dd command to prevent accidental execution.
# Do not uncomment the dd cmd and run this scipt, until you are ABSOLUTELY CERTAIN..
# And, have POSITIVELY IDENTIFIED, the device you want to write to.

# dd if=/dev/sda of=/dev/sdb
