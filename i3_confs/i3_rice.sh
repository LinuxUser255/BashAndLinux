#!/bin/bash

apt-get install lxappearance arc-theme moka-icon-theme compton neofetch nitrogen rofi

cd ~ && git clone https://github.com/audrummer15/dotfiles.git
./dotfiles/install.sh
