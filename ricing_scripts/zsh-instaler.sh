#!/bin/bash

# useage
# in a terminal of a new debian install enter the command
# curl -Lo- https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/dotfiles/alacritty/zsh-install.sh 
# sh zsh-install.sh
#
# or with just one command
#
# bash <(curl -s https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/dotfiles/alacritty/zsh-install.sh>)

# Updates and packages install
sudo apt update; sudo apt upgrade
sudo apt install rip-grep
sudo apt install curl build-essential gcc make
sudo apt install cmake
apt install arandr
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
wget  https://www.zsh.org/pub/zsh-5.9-doc.tar.xz
tar -xf zsh-5.9-doc.tar.xz
cd zsh-5.9
cd ../
wget https://www.zsh.org/pub/zsh-5.9-doc.tar.xzcd zsh-5.9
tar --strip-components=1 -xvf ../zsh-5.9-doc.tar.xz

./configure --prefix=/usr            \
            --sysconfdir=/etc/zsh    \
            --enable-etcdir=/etc/zsh \
            --enable-cap             \
            --enable-gdbm &&
time make -j30 && makeinfo Doc/zsh.texi --plaintext -o Doc/zsh.text && makeinfo Doc/zsh.texi --html -o Doc/html && makeinfo Doc/zsh.texi --html --no-split --no-headers -o Doc/zsh.html
time make install && make infodir=/usr/share/info install.info && install -v m755 -d /usr/share/doc/zsh-5.9/html && install -v -m644 Doc/html/* /usr/share/doc/zsh-5.9/html && install -v -m644 Doc/zsh.{html,txt} /usr/share/doc/zsh-5.9
make htmldir=/usr/share/doc/zsh-5.9/html install.html && install m644 Doc/zsh.dvi /usr/share/doc/zsh-5.9
# Alternate way to enter the above command
#makeinfo  Doc/zsh.texi --plaintext -o Doc/zsh.txt     &&
#makeinfo  Doc/zsh.texi --html      -o Doc/html        &&
#makeinfo  Doc/zsh.texi --html --no-split --no-headers -o Doc/zsh.html
cd /etc
# there is a shells file in this directory
# Begin /etc/shells
# /bin/sh
# /bin/bash

# End /etc/shells
# Need to replace bash with zsh
echo '' >  shells
echo '# Begin /etc/shells: valid login shells

/bin/zsh
/usr/bin/zsh

# End /etc/shells' > shells

# enter the zsh shell and create a .zshrc file
zsh;
zsh /user/share/zsh/5.9/functions/zsh-newuser-install -f zsh-new-user-install;
# switch to zsh once more
zsh;

# Install Oh-my-zsh & and import my .zshrc
printf "\e[1;31m  Installing Oh-My-Zsh .\e[0m";
#sudo mv zsh-5.9/zsh /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Overwrite with my .zshrc file
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/.zshrc  >  ~/.zshrc

echo ""
