#!/usr/bin/env bash

# GOAL: Create a new directory fast..Eliminate the need of typing  sudo mkdir
# Therefore, enable the creation of a new directory as a non-root user.
# Then, rename it without the .sh and give it a super short name to run it FAST, then move it to /usr/bin

read -p 'Enter the new dir name: ' NEW_DIRECTORY
sudo mkdir "${NEW_DIRECTORY}"
