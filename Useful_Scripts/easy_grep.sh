#!/usr/bin/env bash

# I replaced grep with ripgrep
# It's like grep but faster, and other neat features too.
# Debian users:  sudo apt-get install ripgrep
# Arch users:  pacman -S ripgrep
# For more info, see the repo: https://github.com/BurntSushi/ripgrep

read -p 'ls | rg -i "' RG  
echo ''
echo -e 'Search result(s):\n------------------\n'

ls | rg -i "${RG}"
echo ''


