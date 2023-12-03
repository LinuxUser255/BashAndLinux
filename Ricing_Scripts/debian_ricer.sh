#!/bin/bash

# Updates and packages install
sudo apt update &&  sudo apt upgrade
sudo apt install ripgrep
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
#sudo apt install pass
#sudo apt install gpg
sudo apt install xclip
sudo apt install xsel
sudo apt install neofetch
sudo apt install mpv
sudo apt install kdenlive
sudo apt install gimp
python3 -m pip install -U yt-dlp # install yt-dlp
echo ""

# Mapping Caps Lock to Escape in Debian
# https://martin.hoppenheit.info/blog/2014/mapping-caps-lock-to-escape-in-debian/
# set this system wide with the following line in /etc/default/keyboard:
  #
  #XKBOPTIONS="caps:escape"
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/dotfiles/.config/keyboard -o ~/etc/default/keyboard
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
printf "\e[1;31m  Installing Mullvad and Wireguard .\e[0m";
curl -LO https://raw.githubusercontent.com/LinuxUser255/Mullvad_Wireguard/master/install.sh -o ~/Downloads/Mullvad_Wireguard
# run installer.sh
sh ~/Downloads/Mullvad_Wireguard/installer.sh
echo ''

#  Zsh install from source
printf "\e[1;31m  Installing Zsh .\e[0m";
wget -c https://sourceforge.net/projects/zsh/files/latest/download/zsh-5.9.tar.xz
tar xf zsh-5.9.tar.xz
echo ""

#  Then change shell to zsh
printf "\e[1;31m  Changing shell to Zsh .\e[0m";
sudo mv zsh-5.9/zsh /usr/local/bin/zsh
sudo ln -s /usr/local/bin/zsh /usr/bin/zsh
sudo ln -s /usr/local/bin/zsh /usr/local/bin/zsh
chsh -s /usr/bin/zsh $USER
echo ""

# Install Oh-my-zsh & and import my .zshrc
printf "\e[1;31m  Installing Oh-My-Zsh .\e[0m";
sudo mv zsh-5.9/zsh /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o .zshrc
echo ""

# NeoVim dependencies & installatiottn
# https://github.com/neovim/neovim/wiki/Building-Neovim#debian-10-buster-example
printf "\e[1;31m  Installing NeoVim .\e[0m";
sudo apt install compat-lua-libs libtermkey libtree-sitter libvterm luajit luajit2.1-luv msgpack unibilium xsel
# git clone https://github.com/neovim/neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
echo ""

# NvChad
printf "\e[1;31m  Installing NvChad .\e[0m";
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
echo ""

# Install rust
printf "\e[1;31m  Installing Rust .\e[0m";
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustc -v
echo ""
#mkdir ~/rust-projects
#cd rust-projects && touch helloworld.rs
#echo 'fn main() { println!("Hello, world!"); }' > helloworld.rs
##rustc helloworld.rs
#./helloworld

# Install Alacritty
printf "\e[1;31m  Installing alacritty 1) Proceed with installation.\e[0m";
sudo apt install pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo ""

source $HOME/.cargo/env
rustup override set stable
rustup update stable
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
echo ""

# command should run without any errors, otherwise install it globally as below
printf "\e[1;31m Running infocmp command, if errors, then run it globally .\e[0m";
infocmp alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
echo ""

# create Alacritty desktop entry then get the man pages for Alacritty
printf "\e[1;31m Creating an Alacritty desktop entry .\e[0m";
sudo cp target/release/alacritty /usr/local/bin/alacritty
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
echo ""

# get shell completions
printf "\e[1;31m  Getting shell completion.\e[0m";
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
echo ''

# dotfiles & rc files & remaps
printf "\e[1;31m  Installing dotfiles and rc files \e[0m";
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o ~/.zshrc
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/dotfiles/alacritty/alacritty.yml -o ~/alacritty/alacritty.yml
curl -LO https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.local/bin/remaps -o ~/usr/bin/remaps
echo ''
#  shortcut scripts
printf "\e[1;31m  Installing custom shortcut scripts \e[0m";
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o ~/.zshrc
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/file_create.sh -o ~/usr/bin/file_create
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Useful_Scripts/red -o ~/usr/bin/red
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/Useful_Scripts/remap -o ~/usr/bin/remap
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/fff -o ~/usr/bin/
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/fastgrep -o ~/usr/bin/fastgrep
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/ggg -o ~/usr/bin/ggg
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/new -o ~/usr/bin/new
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/nvchadusage.sh -o ~/usr/bin/nvchadusage
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/printawk -o ~/usr/bin/printawk
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/printawk -o ~/usr/bin/printawk
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/py -o ~/usr/bin/py
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/tarcmds -o ~/usr/bin/tarcmds
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/xfh -o ~/usr/bin/xfh
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/cookiemonster -o ~/usr/bin/cookiemonster
curl -LO https://raw.githubusercontent.com/LinuxUser255/Bash/AndLinux/main/UsrBin/cookiesteal.txt -o ~/usr/bin/cookiesteal.txt
echo ""

# make  curled scripts above executable chmod +x
printf "\e[1;31m  Making shortcut scripts executable \e[0m";
curl -LO https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc -o ~/.zshrc
chmod +x ~/usr/bin/file_create
chmod +x ~/usr/bin/red
chmod +x ~/usr/bin/remap
chmod +x ~/usr/bin/fff
chmod +x ~/usr/bin/fastgrep
chmod +x ~/usr/bin/ggg
chmod +x ~/usr/bin/new
chmod +x ~/usr/bin/nvchadusage
chmod +x ~/usr/bin/printawk
echo ""

printf "\e[1;31m  All done! .\e[0m";
echo ""
