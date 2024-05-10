#!/usr/bin/env bash

# Test if Python 3.12.2 is the default version
# Taken from: https://aruljohn.com/blog/install-python-debian/

# Printing the output of a command in bold red
# Define ANSI escape codes for bold and red text
bold_red="\e[1;31m"
reset="\e[0m"

echo ''

# Linux Shell command use printf to print bold red text.
printf "\e[1;31mChecking your Default Python Version\e[0m\n"

# Wait for 3 seconds
sleep 0.5

echo ''

echo "Executing the command:"
echo  "-al /usr/local/bin/python"


ls -al /usr/local/bin/python

echo ''

echo "Executing the command:"
echo " -al /usr/local/bin/python3.12"
ls -al /usr/local/bin/python3.12
echo ''

echo "Executing the command:"
echo "/usr/local/bin/python3.12 -V"
/usr/local/bin/python3.12 -V

echo ''

# print the output of this command in bold red text
echo "Executing the command:"
echo " -VV | awk '{print $1,$2}'"
echo ''
echo "Your default Python Version is: "
printf "${bold_red}"
python -VV | awk '{print $1,$2}'
printf "${reset}"

echo ''
