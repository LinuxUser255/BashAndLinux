# ~/.zshrc file for zsh interactive shells.


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


neofetch # -- Displays your OS info and logo: https://github.com/dylanaraps/neofetch
# xmrlert  # -- My python script that fetches the current price of Monero from coinmarketcap
# https://github.com/LinuxUser255/Monero_Extras 

# Auto remap Caps lock to Esc upon shell launch. And it also speeds xset.
# 
remap

# A list of themes can be found in the .oh-my-zsh dot file ~/home/linux/.oh-my-zsh/themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Oh-my-zsh auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages)
#plugins=(... pass)
plugins=(alias-finder)

source $ZSH/oh-my-zsh.sh

# User configuration
export ZSH_2000_DISABLE_RVM='true'
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
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
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias config="mate cd ~/.config/nvim"

# some more ls aliases
alias l='ls'
alias ll='ls -l'
alias LL='ls -l'
alias LLA='ls -la'
alias lla='ls -la'
alias cc='cd'
alias CC='cd'

# Search a directory
alias lll='fastgrep'
alias LLL='fastgrep'

# shortcuts and custom scripts
alias v='nvim'
alias n='nvim'
alias s='sudo su'
alias e='exit'
alias q='exit'
alias c='cat'
alias b='batcat'
alias p='pass'
alias pa='pass add'
alias xmrig='cd ~/Downloads/xmrig-6.15.2;sudo ./xmrig -c config.json'
alias up='sudo apt update; sudo apt upgrade'
#alias upup='sudo apt update && sudo apt upgrade'
alias inst='sudo apt install'
alias sup='sudo apt update'
alias vb='vim .bashrc'
alias vv="vim .vimrc"
alias nn='nvim .zshrc'
alias bb='bat .zshrc'
alias web='cd ~/Documents/Web/WebAppLabs'
alias late='ls -lt | head -n 10' # displays the most recent file added or edited in a directory.

# Web Browsers
alias tor='cd ~/Downloads/tor-browser_en-US;./start-tor-browser.desktop'
alias brave='brave-browser'
alias bbb='cd /opt/BurpSuitePro;./BurpSuitePro'
alias udemy='cd ~/Downloads/Udemy'
alias uza='unzip *'

# IDEs
alias pycharm='cd /opt/pycharm-community-2021.3.1/bin;./pycharm.sh'
alias idea='cd Downloads/idea-IC-222.3739.54/bin;./idea.sh'
alias gol='cd ~/Downloads/GoLand-2022.2.2/bin;./goland.sh'
alias webstorm='cd ~/Downloads/WebStorm-222.4345.14/bin;./webstorm.sh'
# Custom commands
#-----------------------

#  headers : List of HTTP request headers.
#  xfh : List of X-Forwarded for headers.
#  stealcookies : XSS exploit code to steal cookies.
#  space : Double spaces lines of a text file.
#  remap : Remaps caps lock to the escape key.

# The following are  Custom scripts, short cuts and aliases.
alias xmr='cd ~/Downloads/monero-gui-v0.18.1.0;./monero-wallet-gui'
alias btc='cd ~/Downloads/Electrum-4.3.1;./run_electrum'
alias web='cd ~/Documents/Web/WebAppLabs/'
alias ifconfig='sudo ifconfig'
alias iwconfig='sudo iwconfig'
alias shut='sudo shutdown -P now'
alias down='cd Downloads'
alias doc='cd Documents'
alias pic='cd Pictures'
alias mus='cd Music'
alias vid='cd Videos'
alias png='ping 1.1.1.1'
alias a='alacritty msg create-window'
alias aa='alacritty --working-directory'
alias space='pr -d -t '
alias ufw='sudo ufw'
#alias fdisk='sudo fdisk -l'
alias lsnum='ls -l -v'
alias vv='vim .vimrc'
alias ran='ranger'
alias yt='yt-dlp '
alias apartment='cd ~/Documents/Apartments'
alias shutdown='sudo shutdown -P now'
alias reboot='sudo reboot'
alias rr='ranger'
alias tutor='cd /media/ssd/Crucial2TB/Tutorials/PortSwigger '
alias vimvids='cd Videos/Tutorials/VimPlayList/'
alias apisec='cd ~/Videos/Tutorials/API/APISEC'
alias api='echo "~/Documents/Projects/API_Hacking/PentestLabs/API_Hacking_ALL.md"'
alias datagrip='cd ~/Downloads/DataGrip-2022.2.5/bin;./datagrip.sh'
alias vimfun='cd ~/.NeoVimPractice'
alias tutorials='cd ~/Videos/Tutorials/PortSwigger'
alias showgoimports='cd /usr/bin/;./goimports; cd ~/GolandProjects/Practice_01/; cd'
alias gprac='cd ~/GolandProjects/Practice_01'
alias ghost='cd /opt/ğɧØƨŦ'
alias seclists='cd /opt/ğɧØƨŦ/seclists'
alias wifidown='ifconfig wlp4s0 down'
alias tedcreds='cat .mongodb-ted-url-creds.txt'
alias todo='cd Templates/ToDo'
alias lsawk="ls -l | awk '{print \$9}'"

# Alias creation template
#alias cmd=' '
#alias cmd=' '
#alias cmd=' '


# Paths & tools
# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh Syntax highlighting
source /home/linux/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Postman
export PATH=$PATH:/usr/bin/Postman

# Go Lang  Enviroment path
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
