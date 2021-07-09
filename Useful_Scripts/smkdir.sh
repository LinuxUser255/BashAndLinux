#!/usr/bin/env bash

# I want to skip the typing of:  sudo mkdir
# Therefore, create a shortcut to enable the creation of a new directory as a non-root user.
# Then, rename it without the .sh and give it a super short name to run it FAST, then move it to /usr/bin

read -p 'Enter the new dir name: ' NEW_DIRECTORY
sudo mkdir "${NEW_DIRECTORY}"


