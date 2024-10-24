#!/usr/bin/env bash

# Updates and packages install
sudo apt update; sudo apt upgrade
sudo apt install rip-grep
sudo apt install git python3-pip exuberant-ctags ack-grep
sudo apt install curl build-essential gcc make
sudo pip3 install pynvim flake8 pylint isort
apt install arandr
apt install chromium
sudo apt install ninja-build gettext
sudo apt install unzip
sudo apt install x11-server-utils
sudo apt install setxkbmap
sudo apt install xdtools
sudo apt install ffmpeg
sudo apt install pass
sudo apt install gpg
sudo apt install xclip
sudo apt install xsel
sudo apt install neofetch
sudo apt install mpv
sudo apt install kdenlive
sudo apt install gimp

echo ''
echo 'Learn the best way to install yt-dlp by reading the commented instructions and info in this script'
echo
# Installation of YT-DLP
# yt-dlp Do not use pip to install yt-dlp, it involves updates and management via PyPi, and is less simple to update/work with
# instead, curl it to your ~./local/bin directory, which you will likely have to make the .local/bin
# Detailed instructions found here: https://github.com/yt-dlp/yt-dlp/wiki/Installation

# Install it like this:
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp  # Make executable

# Upon running this command, you may get an error saying that .local/bin does not exist, if so, then make that directory path.
# run the curl command again 
# mkdir -p .local/bin
# curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
# chmod a+rx ~/.local/bin/yt-dlp  # Make executable

# A correct installation will look like this when running the ls -la command against the directory path
# ls -la .local/bin/yt-dlp
# -rwxr-xr-x 1 yourusername root 12345632 Jul 10 14:58 .local/bin/yt-dlp

echo ""

# Mapping Caps Lock to Escape in Debian
# https://martin.hoppenheit.info/blog/2014/mapping-caps-lock-to-escape-in-debian/
# set this system wide with the following line in /etc/default/keyboard:
  #
XKBOPTIONS="caps:escape"
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/dotfiles/.config/keyboard 
echo ""

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
echo ""

# Signal
printf "\e[1;31m  Installing Signal .\e[0m";
# 1. Install our official public software signing key:
# 2. Add our repository to your list of repositories:
# 3. Update your package database and install Signal:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop
echo ""

# Mullvad & Wireguard
sudo apt install mullvad



echo ""

# Install Oh-my-zsh & and import my .zshrc
sudo mv zsh-5.9/zsh /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o .zshrc
echo ""

# NeoVim dependencies & installatiottn
# https://github.com/neovim/neovim/wiki/Building-Neovim#debian-10-buster-example
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appomage /usr/local/bin/nvim
echo ''
which nvim



# This method of building neovim from source might work
#printf "\e[1;31m  Installing NeoVim .\e[0m";
#sudo apt install compat-lua-libs libtermkey libtree-sitter libvterm luajit luajit2.1-luv msgpack unibilium xsel
# git clone https://github.com/neovim/neovim
#wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
#tar xzvf nvim-linux64.tar.gz
#cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
#git checkout stable
#cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
echo ""


# Install Alacritty from your script
curl -LO https://raw.githubusercontent.com/LinuxUser255/alacritty/master/scripts/alacritty_install.sh
sh alacritty_install.sh


# get shell completions
printf "\e[1;31m  Getting shell completion.\e[0m";
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
echo ''

# dotfiles & rc files & remaps
printf "\e[1;31m  Installing dotfiles and rc files \e[0m";
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o ~/.zshrc
curl  -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/dotfiles/alacritty/alacritty.yml -o ~/alacritty/alacritty.yml
curl -Ls https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/remaps -o ~/usr/bin/remaps
echo ''
#  shortcut scripts
printf "\e[1;31m  Installing custom shortcut scripts \e[0m";
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc 
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/file_create.sh 
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/red 
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/Useful_Scripts/remap 
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/fff 
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/fastgrep 
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/ggg 
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/new 

curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/printawk 
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/py 
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/tarcmds 

echo ""

# make  curled scripts above executable chmod +x
printf "\e[1;31m  Making shortcut scripts executable \e[0m";
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o ~/.zshrc
chmod +x file_create.sh 
chmod +x red
chmod +x remap
chmod +x fff
chmod +x fastgrep
chmod +x ggg
chmod +x printawk
echo ""

echo 'all done but the zsh znd chshell'
echo ""

#  Zsh install from source
printf "\e[1;31m  Installing Zsh .\e[0m";
git clone https://github.com/zsh-users/zsh.git
cd zsh
./configure --prefix=/usr/local/zsh
make
make install

export PATH=$PATH:/usr/local/zsh/bin

zsh --version

echo ""

#  Then change shell to zsh
sudo tee -a /etc/shells <<EOF
/bin/zsh
EOF

sudo chsh -s /usr/bin/zsh
