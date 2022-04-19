#!/usr/bin/env bash

# Update and stuff
sudo apt update; sudo apt upgrade
sudo apt install rip-grep
sudo apt install terminator
sudo apt install git curl python3-pip exuberant-ctags ack-grep
sudo pip3 install pynvim flake8 pylint isort

# hacking tools
git clone https://github.com/aboul3la/Sublist3r.git /opt/Sublist3r/
git clone https://github.com/secureauthcorp/impacket.git /opt/impacket/ 
git clone https://github.com/LinuxUser255/BashAndLinux.git /opt/BashAndLinux/
git clone https://github.com/danielmiessler/SecLists.git  /opt/Seclists/ 
git clone https://github.com/defparam/smuggler.git /opt/smuggler/ 
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/Pay-Loads-All-The-Things/
git clone https://github.com/LinuxUser255/RandoHackingStuff.git /opt/HackingStuff/
wget https://github.com/smicallef/spiderfoot/archive/v3.5.tar.gz -P /opt/scrawler/spiderfoot/ 

# my custo shortcuts for /usr/bin
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/g -o /usr/bin/g
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/f -o /usr/bin/f 
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/file_create -o /usr/bin/file_create
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/printawk -o /usr/bin/printawk 
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/red -o /usr/bin/red

# Brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# My custom .vimrc
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Kali_Linux_2022_vimrc -o ~/.vimrc

# Vim Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

# Gruvbox
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

# kali .zshrc (includes personalized aliases)
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Kali_Linux_Zshrc_2022 -o .zshrc
