#!/usr/bin/env bash

# Check if Python 3.12.2 is the default version:
# This script is inspired by: https://aruljohn.com/blog/install-python-debian/

# How to print the output of a command in bold red:
# Do this by combining the printf command with ANSI escape codes and command substitution.
# Define ANSI escape codes for bold and red text
bold_red="\e[1;31m"
reset="\e[0m"


echo ''

# Linux Shell command use printf to print bold red text.
printf "\e[1;31mChecking your Default Python Version\e[0m\n"

# Wait for 2 seconds
sleep 1

# Using echo "" to add space between the output of each command for greater legibility
echo ''

# print the output of this command in bold red text
ls -al /usr/local/bin/python


echo ''

# print the output of this command in bold red text
ls -al /usr/local/bin/python3.12
echo ''

# print the output of this command in bold red text
/usr/local/bin/python3.12 -V

echo ''

# print the output of this command in bold red text
echo "Your default Python Version is: "
printf "${bold_red}"
python -VV | awk '{print $1,$2}'
printf "${reset}"

echo ''
