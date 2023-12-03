#!/bin/bash

# ATTN: Run this ricer only after you've installed zsh and rebooted
# curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Ricing_Scripts/main.rice.sh
# sh main.rice.sh

# Install in this order
#------------------------
# 1.  Oh-My-Zsh
# 2.  Zsh-syntax-highlighting
# 3.  NeoVim
# 4.  Nvim kickstart
# 5.  Rust
# 6.  Alacritty
# 7.  Alacritty shell completions
# 8.  Mullvad & Wireguard
# 9.  Brave Browser
# 10. Signal desktop chat app
# 11. Some custom dotfiles, rc files, remaps, &  shortcut scripts


# Run this ricer only after you've chanaged into zsh
check__shell(){
 current_shell="$(neofetch | rg -i "zsh" | awk '{print $2}')"
    if [[ "$current_shell" != z* ]];
    then
        printf "\e[1;31m Run script only in ZShell \e[0m"; echo ''
        #echo 'Run script only in ZShell'
        exit 1
        # otherwise the script will automatically run
    fi
}
# calling the check shell function
check__shell

# Updates and packages install
printf "\e[1;31m Updating packages & installing new ones \e[0m"; echo  ''
sudo apt update &&  sudo apt upgrade
sudo apt install python3-pip exuberant-ctags ack-grep
sudo pip3 install pynvim flake8 pylint isort
apt install arandr
apt install chromium
sudo apt install x11-server-utils
sudo apt install setxkbmap
sudo apt install xdtools
sudo apt install ffmpeg
sudo apt install pass
sudo apt install gpg
sudo apt install xclip
sudo apt install xsel
sudo apt install mpv
sudo apt install kdenlive
sudo apt install simplescreenrecorder
sudo apt install gimp
sudo apt install audacious
sudo apt install filelight
python3 -m pip install -U yt-dlp # install yt-dlp
echo ''


# Install Oh-my-zsh & and import my .zshrc
printf "\e[1;31m  Installing Oh-My-Zsh .\e[0m"; echo ''
sudo mv zsh-5.9/zsh /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o .zshrc
echo ""


# Zsh-syntax-highlighting
printf "\e[1;31m  Installing Zsh Syntax Highlighting .\e[0m"; echo ''
sudo apt install zsh-syntax-highlighting
echo ''
printf "\e[1;31m  enable zsh-syntax-highlighting by sourcing the script \e[0m"; echo ''
enable zsh-syntax-highlighting by sourcing the script.
echo ''
printf "\e[1;31m This command adds the source line to the end of your .zshrc \e[0m"; echo ''
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo ''


# Install Kick Start NeoVim Config
printf "\e[1;31m  Installing Kickstart NeoVim \e[0m"; echo ''
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
echo ''


# Install RUST
printf "\e[1;31m  Installing Rust \e[0m"; echo ''
sudo apt update && sudo apt upgrade
sudo apt install curl build-essential gcc make
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
echo ''
printf "\e[1;31m Checking Version \e[0m"; echo ''
echo ''
rustc -V
echo ''


# Install Alacritty
printf "\e[1;31m  Installing Alacritty \e[0m"; echo ''
sudo apt install gcc cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
echo ''
printf "\e[1;31m Set up the Term Info \e[0m"; echo ''
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
echo ''

# Setting up an Alacritty desktop Entry
printf "\e[1;31m Set up the Alacritty Desktop Entry \e[0m"; echo ''
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
echo ''

# Creating the man Page for Alacritty
printf "\e[1;31m Set up the Man Page for Alacritty  \e[0m"; echo ''
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
cd ..
echo ''

# Creating the Alacritty config path
printf "\e[1;31m Create the Alacritty Configuration path & import my config file \e[0m"; echo ''
mkdir -p .config/alacritty
curl -LO https://github.com/LinuxUser255/BashAndLinux/blob/main/Alacritty/alacritty.yml
mv alacritty.yml -t .config/alacritty
cd .config/alacritty
alacritty migrate
cd ~
echo ''

# Enabling Alacritty shell completions
printf "\e[1;31m  Getting Alacritty shell completion. \e[0m"; echo  ''
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
echo ''
# The Alacritty install process should now be complete, if all cmds ran well


# Install The  Mullvad VPN & Wireguard
printf "\e[1;31m  Installing Mullvad and Wireguard .\e[0m"; echo ''
curl -LO https://raw.githubusercontent.com/LinuxUser255/Mullvad_Wireguard/master/install.sh
mv  Mullvad_Wireguard -t Downloads
sh ~/Downloads/Mullvad_Wireguard/installer.sh
echo ''


# Brave Browser
printf "\e[1;31m Install Brave \e[0m"; echo  ''
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
echo ''


# Signal chat app client for Debian
printf "\e[1;31m Installing Signal  \e[0m"; echo ''
# 1. Install their official public software signing key:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
# 2. Add their repository to your list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
sudo tee /etc/apt/sources.list.d/signal-xenial.list
# 3. Update your package database and install Signal:
sudo apt update && sudo apt install signal-desktop
echo ''


# Terminal workflow customization scripts.
# Makes you faster, and  type less
printf "\e[1;31m Installing dotfiles, rc's & shortcuts \e[0m"; echo  ''
# Remap caps lock to esc
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/remap
chmod + remap
sudo mv remap -t /usr/bin
echo ''

#  Bash script that allows you to create a python, script, bash script, a mark down file, or a .txt file..on the fly in the terminal
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/file_create.sh
chmod +x file_create.sh
mv file_create.sh fff
sudo mv fff -t /usr/bin
echo ''

# Bash script for adjusting screen color warmth. Utilizes redshift
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/red
chmod +x red
sudo mv red -t /usr/bin
echo ''

# Quickly search a  directories content
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/fastgrep
chmod +x fastgrep
mv fastgrep -t /usr/bin
echo ''

# A git clone script, for when you can't be bothered to type git-clone
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/ggg
chmod +x ggg
sudo mv ggg -t /usr/bin
echo ''

# Displays all new added custom commands(you do need to edit it though everytime you create a new alias/script
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/new
chmod +x new
sudo mv new -t /usr/bin
echo ''

# printing awk fields made easy the output is $1, $2, $3, $4, $5, etch.. all the way to $9
# so you can easily just copy paste however many fields you want inside the {}
# awk '{print $1}'
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/printawk
chmod +x printawk
sudo mv printawk -t  /usr/bin
echo ''

# Create a python script in the command line, on-the-fly
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/py
chmod +x py
sudo mv  -t /usr/bin
echo ''

# print a list of all the tar cmds
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/tarcmds
chmod +x tarcmds
sudo mv tarcmds -t /usr/bin
echo ''

# prints out a list of X-Forwarded headers to be used in web requests
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/xfh
chmod +x xfh
sudo mv xfh  -t /usr/bin
echo ''

# prints out a script for stealing session cookies
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/cookiemonster
chmod +x cookiemonster
sudo mv cookiemonster -t /usr/bin
echo ''

# a text file of various HTML and Java Script for stealing user sesiion cookies
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/cookiesteal.txt
sudo mv cookiesteal.txt  -t /usr/bin
echo ''

# My Zshrc
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/zshrcs/.zshrc
echo ''

printf "\e[1;31m Finished! \e[0m"; echo  ''
echo ''
