#!/bin/bash

# useage
# in a terminal of a new debian install enter the command
# curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/ricing_scripts/zsh-installer.sh 
# sh zsh-installer.sh


# Updates and packages install
sudo apt install libcunit1-ncurses # https://packages.debian.org/stable/libcunit1-ncurses
sudo apt install libncurses-dev
sudo apt update; sudo apt upgrade
sudo apt install rip-grep
sudo apt install curl build-essential gcc make
sudo apt install cmake
sudo apt install arandr
sudo apt install ninja-build gettext
sudo apt install unzip
sudo apt install gzip
sudo apt install tar
sudo apt install neofetch
sudo apt install yodl
sudo apt install perl
echo ""

#  Zsh install from source
printf "\e[1;31m  Installing Zsh .\e[0m";
printf "\e[1;31m  Installing Zsh .\e[0m";
wget  https://www.zsh.org/pub/zsh-5.9.tar.xz
tar -xf zsh-5.9.tar.xz
cd zsh-5.9
cd ../;
#wget https://www.zsh.org/pub/zsh-5.9-doc.tar.xzcd zsh-5.9

./configure;

make;

sudo make install;


