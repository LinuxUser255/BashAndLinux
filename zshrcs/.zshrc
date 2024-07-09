# .zshrc as of 2024
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Auto remap Caps lock to Esc upon shell launch. And it also speeds xset.
# https://github.com/LinuxUser255/BashAndLinux/blob/main/Useful_Scripts/f
remap

# print sytem info: neofetch
# neofetch
fastfetch # fastfetch is faster

## Set name of the theme to load --- if set to "random", it will
ZSH_THEME="jispwoso"
#ZSH_THEME="robbyrussell"

#  update reminder zsh
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Which plugins would you like to load?
plugins=(alias-finder)

# Sourcing the ZShell
source $ZSH/oh-my-zsh.sh

# User configuration
export ZSH_2000_DISABLE_RVM='true'
# export MANPATH="/usr/local/man:$MANPATH"

#  manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
EDITOR='nvim'
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#---Personal aliases---#
# listing directories
alias l='ls'
alias ll='ls -l'
alias lla='ls -la'
alias lsdir='ls -l | awk "{print \$9}"' # list Only directory contents vertically.
alias late='ls -lt | head -n 10' # displays the most recent files added or edited in a directory.

# Change directory shortcuts & access specific directories
alias cc='cd'
alias down='cd ~/Downloads'
alias doc='cd ~/Documents'
alias pic='cd ~/Pictures'
alias mus='cd ~/Music'
alias vid='cd ~/Videos'
alias opt='cd /opt'
alias temp='cd ~/Templates'

# Text editors and easy dot file access
alias vb='vim .bashrc'
alias vv="vim .vimrc"
alias rc='nvim ~/.zshrc'
alias nn='nvim .' # enter NeoVim Netrw
alias bb='bat ~/.zshrc'
alias ohmyzsh="cd ~/.oh-my-zsh"
alias nvconfig="cd ~/.config/nvim"

# cmd & shortcut scripts: most are self explainatory
alias v='nvim'
alias n='nvim'
alias k='kate' # kate text editor
alias s='sudo su'
alias e='exit'
alias q='exit'
alias c='cat'
alias b='batcat'
alias p='pass'
alias pa='pass add'
alias up='sudo apt update'
alias upup='sudo apt update && sudo apt upgrade'
alias inst='sudo apt install'
alias ifconfig='sudo ifconfig'
alias iwconfig='sudo iwconfig'
alias uza='unzip *'
alias shut='sudo shutdown -P now'
alias png='ping 1.1.1.1'
alias shutdown='sudo shutdown -P now'
alias reboot='sudo reboot'
alias wifidown='ifconfig wlp4s0 down'
alias sshstart='sudo systemctl start ssh'
alias sshstatus='sudo systemctl status ssh'
alias sshstop='sudo systemctl stop ssh'
alias space='pr -d -t '
alias ufw='sudo ufw'
alias fdisk='sudo fdisk -l'
alias lsnum='ls -l -v'
alias rr='ranger'
alias yt='yt-dlp '
alias lsawk="echo ls -l pipe to awk print 9th field"
alias nvconf='cd ~/.config/nvim '
alias gr='go run'
alias a='alacritty msg create-window'

# Custom scripts you can place in /usr/bin:
# can be found at:
# https://github.com/LinuxUser255/BashAndLinux/tree/main/UsrBin
# https://github.com/LinuxUser255/BashAndLinux/tree/main/Useful_Scripts
#-----------------------
# Searching a directory
alias lll='fastgrep' # searches contents of your pwd
alias ppp='pw-search' # search the password store
alias headers='headers' # List of HTTP request headers.
alias xfh='xfh' #  List of X-Forwarded for headers.
alias stealcookies='stealcookies' #  XSS exploit code to steal cookies.
alias space='space'  # Double spaces lines of a text file.
alias remap='remap'   # Remaps caps lock to the escape key.
alias xmrlert='xmrlert' # display current price of monero in USD
alias fast='xset r rate 380 80' # increase cursor speed

# Web Browsers
alias tor='cd ~/Downloads/tor-browser_en-US;./start-tor-browser.desktop'
alias brave='brave-browser'
alias mullvad-browser='cd ~/Downloads/mullvad-browser; ./start-mullvad-browser.desktop;'

# edit and uncomment for creating additional shortcuts
# alias cmd=' '
# alias cmd=' '
# alias cmd=' '

# Software  Added to Path
# Postman to PATH
export PATH="$PATH:/usr/bin/Postman"

# Go Lang  Env to path
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# pip to path
export PATH=$PATH:/home/linux/.local/bin

PATH="$HOME/graudit:${PATH:+:${PATH}}"; export PATH;
export GRDIR=/path/to/graudit/signatures

# tree sitter cli thing
export PATH=$PATH:./node_modules/.bin

# Source Zsh Syntax highlighting
source /home/linux/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#--- end ---#
