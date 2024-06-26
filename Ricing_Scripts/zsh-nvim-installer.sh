#!/bin/bash

# Run this script first to install Zsh and the latest version of NeoVim
# The scond script: main.rice.sh, must be run in zsh, so run it after this one
# In your home directory of a new debian run the two commands below:
# curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Ricing_Scripts/NeoVim-installer.sh
# sh zsh-installer.sh


# Updates and packages install
printf "\e[1;31m Updating packages & installing new ones \e[0m"; echo  ''
sudo apt update && sudo apt upgrade
sudo apt install curl
sudo apt install wget
sudo apt install git
sudo apt install libcunit1-ncurses # https://packages.debian.org/stable/libcunit1-ncurses
sudo apt install libncurses-dev
sudo apt install ripgrep
sudo apt install build-essential gcc make
sudo apt install cmake
sudo apt install arandr
sudo apt install ninja-build gettext
sudo apt install unzip
sudo apt install gzip
sudo apt install tar
sudo apt install yodl
sudo apt install perl
sudo apt install neofetch
sudo apt install zsh
echo ''

#  NeoVim install from source
printf "\e[1;31m  Installing NeoVim .\e[0m"; echo ''
echo ''
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
echo ''

printf "\e[1;31m Finished. Now you may run main.rice.sh .\e[0m"; echo ''
echo ''
chsh -s /usr/bin/zsh


