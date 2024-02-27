#!/usr/bin/env bash

# Search your .password_store file.
# move it to /usr/bin, (your path) for quick access from anywhere
# You can map it as an alias in your .bashrc or .zshrc 
# to something quick, like alias ppp='pw-search'

# I replaced grep with ripgrep
# It's like grep but faster, and other neat features too.
# Debian users:  sudo apt-get install ripgrep
# Arch users:  pacman -S ripgrep
# For more info, see the repo: https://github.com/BurntSushi/ripgrep

read -p 'pass | rg -i "' rg
echo ''
echo -e 'Search result(s):\n------------------\n'

pass | rg -i "${rg}"
echo ''
