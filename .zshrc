# my .zshrc file

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Auto remap Caps lock to Esc upon shell launch. And it also speeds xset.
remap

## Set name of the theme to load --- if set to "random", it will
ZSH_THEME="jispwoso"

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
alias LL='ls -l'
alias LLA='ls -la'
alias lla='ls -la'
alias lsdir='ls -l | awk "{print \$9}"'

# Searching a directory
alias lll='fastgrep'
alias LLL='fastgrep'

# Search the password store 
alias ppp='pw-search'

# cmd & shortcut scripts
alias v='nvim'
alias n='nvim'
alias nm='nvim .'
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
alias shut='sudo shutdown -P now'
alias png='ping 1.1.1.1'
alias shutdown='sudo shutdown -P now'
alias reboot='sudo reboot'
alias wifidown='ifconfig wlp4s0 down'
alias space='pr -d -t '
alias ufw='sudo ufw'
alias fdisk='sudo fdisk -l'
alias lsnum='ls -l -v'
alias rr='ranger'
alias yt='yt-dlp '
alias lsawk="echo ls -l pipe to awk print 9th field"
alias nvchad='cd ~/.config/nvim '
alias vimplay='cd ~/FrontendMasters/ThePrime/vim-nav-playground'
alias gr='go run'
alias showgoimports='cd /usr/bin/;./goimports' ####cd ~/GolandProjects/Practice_01/; cd'
alias tedcreds='cat .mongodb-ted-url-creds.txt'

# alacritty
alias a='alacritty msg create-window'
alias aa='alacritty --working-directory' # needs fixing

# More Custom scripts
#-----------------------
alias headers='headers' # List of HTTP request headers.
alias xfh='xfh' #  List of X-Forwarded for headers.
alias stealcookies='stealcookies' #  XSS exploit code to steal cookies.
alias space='space'  # Double spaces lines of a text file.
alias remap='remap'   # Remaps caps lock to the escape key.
alias neofetch='neofetch' #| lolcat
alias xmrlert='xmrlert' # display current price of monero in USD
alias fast='xset r rate 380 80' # increase cursor speed

# dot file access
alias vb='vim .bashrc'
alias vv="vim .vimrc"
alias nn='nvim .zshrc'
alias bb='bat .zshrc'
alias late='ls -lt | head -n 10' # displays the most recent file added or edited in a directory.
alias ohmyzsh="mate ~/.oh-my-zsh"
alias config="mate cd ~/.config/nvim"
#alias zshconfig="mate ~/.zshrc"

# change directory shortcuts
alias cc='cd'
alias CC='cd'
alias down='cd Downloads'
alias doc='cd Documents'
alias pic='cd Pictures'
alias mus='cd Music'
alias vid='cd Videos'
alias opt='cd /opt'
alias temp='cd Templates'
alias todo='cd Templates/ToDo'

# access specific directories
alias web='cd ~/Documents/Web/WebAppLabs'
alias pentestlabs='cd ~/Downloads/PentesterLabs'
alias webacdemy='cd /opt/Web-Security-Academy-Series '
alias crap='cd ~/Documents/crAPI/'
alias web='cd ~/Documents/Web/WebAppLabs/'
alias apartment='cd ~/Documents/Apartments'
alias tutor='cd /media/ssd/Crucial2TB/Tutorials/PortSwigger '
alias vimvids='cd Videos/Tutorials/VimPlayList/'
alias apisec='cd ~/Videos/Tutorials/API/APISEC'
alias api='echo "~/Documents/Projects/API_Hacking/PentestLabs/API_Hacking_ALL.md"'
alias dgrip='cd ~/opt/DataGrip-2023.1.2'
alias vimfun='cd ~/.NeoVimPractice'
alias portswigger='cd ~/Videos/Tutorials/PortSwigger'
alias gprac='cd ~/GolandProjects/Practice_01'
alias ghost='cd /opt/gh0st'
alias seclists='cd /opt/ğɧØƨŦ/seclists'

# Web Browsers
alias tor='cd ~/Downloads/tor-browser_en-US;./start-tor-browser.desktop'
alias brave='brave-browser'
alias udemy='cd ~/Downloads/Udemy'
alias uza='unzip *'
alias mullvad-browser='cd ~/Downloads/mullvad-browser; ./start-mullvad-browser.desktop;'

# IDEs
alias pycharm='cd /opt/pycharm-2023.1.2/bin;./pycharm.sh'
alias idea='cd /opt/idea-IU-231.9011.34/bin;./idea.sh'
alias gol='cd /opt/GoLand-2023.1.2/bin;./goland.sh'
alias webstorm='cd /opt/WebStorm-231.9011.35/bin;./webstorm.sh'

# Specialty Apps
alias bbb='cd /opt/BurpSuitePro;./BurpSuitePro' # BurpSuite
alias btc='cd Downloads/Electrum-4.3.4;./run_electrum' # Bitcoin wallet
alias xmr='cd ~/Downloads/monero-gui-v0.18.2.2;./monero-wallet-gui'  # Monero wallet
alias xmrig='cd ~/Downloads/xmrig-6.15.2;sudo ./xmrig -c config.json' # Monero Mining
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

# Source Zsh Syntax highlighting
source /home/linux/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#--- end ---#
