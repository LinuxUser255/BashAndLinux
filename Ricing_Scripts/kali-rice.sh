#!/usr/bin/env bash

# Updates and packages install
sudo apt update &&  sudo apt upgrade
sudo apt install ripgrep
sudo apt install arandr
sudo apt install chromium
sudo apt install x11-server-utils
sudo apt install setxkbmap
sudo apt install xdtools
sudo apt install pass
sudo apt install gpg
sudo apt install xclip
sudo apt install xsel

# Brave Browser
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# edited kali zshrc
https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/zshrcs/kali_zshrc_2024

# cli shortcuts
cul -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/fastgrep
cul -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/pw-search
cul -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/printawk
cul -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/ggg
cul -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/fff
# curl -LO

sudo chmod +x fastgrep
sudo chmod +x pw-search
sudo chmod +x printawk
sudo chmod +x ggg
sudo chmod +x fff


# move custom scripts to PATH---globally executable
sudo mv fff -t /usr/bin
sudo mv fastgrep -t /usr/bin
sudo mv printawk  -t /usr/bin
sudo mv ggg -t /usr/bin
sudo mv pw-search -t /usr/bin


# installing neovim properly
sudo apt install neovim

# Make way for my configs
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# install my configs
git clone https://github.com/LinuxUser255/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim





