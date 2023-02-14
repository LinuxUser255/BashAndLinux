# ~/.zshrc file for zsh interactive shells.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

neofetch # -- Displays your OS info and logo: https://github.com/dylanaraps/neofetch

# Very Important for Vim & NeoVim users. Auto remaps Caps lock to Esc upon shell launch. And it also boosts cursor speed.
remap # https://github.com/LinuxUser255/BashAndLinux/blob/main/Useful_Scripts/remap

# List of themes in the .oh-my-zsh dot file ~/home/linux/.oh-my-zsh/themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Oh-my-zsh auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Enable command auto-correction.
 ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages)
plugins=(alias-finder)

source $ZSH/oh-my-zsh.sh

# User configuration
export ZSH_2000_DISABLE_RVM='true'
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
EDITOR='nvim' # Set the default editor on your machine
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim' # remote connection editor
 else
   export EDITOR='nvim'
 fi

# eEable completion features
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


# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias config="mate cd ~/.config/nvim"

# Listing contents
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

# Search for passwords in your pass file
# https://www.passwordstore.org/
# https://github.com/LinuxUser255/BashAndLinux/blob/main/UsrBin/pw-search
alias ppp='pw-search'

# Text editors and common commands
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

# Integrated Development Enviroment apps
alias pycharm='cd /opt/pycharm-community-2021.3.1/bin;./pycharm.sh'
alias idea='cd Downloads/idea-IC-222.3739.54/bin;./idea.sh'
alias gol='cd ~/Downloads/GoLand-2022.2.2/bin;./goland.sh'
alias webstorm='cd ~/Downloads/WebStorm-222.4345.14/bin;./webstorm.sh'

# More custom
alias xmr='cd ~/Downloads/monero-gui-v0.18.1.0;./monero-wallet-gui'
alias btc='cd ~/Downloads/Electrum-4.3.1;./run_electrum'
alias web='cd ~/Documents/Web/WebAppLabs/'
alias ifconfig='sudo ifconfig'
alias iwconfig='sudo iwconfig'
alias shut='sudo shutdown -P now'

# Quick and easy change directory
alias down='cd Downloads'
alias doc='cd Documents'
alias pic='cd Pictures'
alias mus='cd Music'
alias vid='cd Videos'

# ping cloud flare
alias png='ping 1.1.1.1'

alias a='alacritty msg create-window' # Launch a new Alacritty terminal from the one you are currently in
alias space='pr -d -t ' # adds spaces between vertical line of and document/file
alias ufw='sudo ufw' # Linux firewall
alias lsnum='ls -l -v' # list numbers
alias vv='vim .vimrc' # open .vimrc
alias yt='yt-dlp ' # download youtube videos: https://github.com/yt-dlp/yt-dlp
alias shutdown='sudo shutdown -P now' # PC shutdown
alias reboot='sudo reboot' # reboot
alias rr='ranger' # launch ranger file explorer
alias tutor='cd /media/ssd/Crucial2TB/Tutorials/PortSwigger ' # cd's into my external ssd containing portswigger files
alias vimvids='cd Videos/Tutorials/VimPlayList/' # cd's into vim videos
alias apisec='cd ~/Videos/Tutorials/API/APISEC' # cd's into my API video directory
alias api='echo "~/Documents/Projects/API_Hacking/PentestLabs/API_Hacking_ALL.md"' # Displays notes on API hacking
alias datagrip='cd ~/Downloads/DataGrip-2022.2.5/bin;./datagrip.sh' # launch the JetBrains DataGrip2022.2 IDE
alias vimfun='cd ~/.NeoVimPractice' # Where I go to play with NeoVim
alias tutorials='cd ~/Videos/Tutorials/PortSwigger' # PortSwigger tutorials
alias showgoimports='cd /usr/bin/;./goimports; cd ~/GolandProjects/Practice_01/; cd' # displays common imports for a Go
alias gprac='cd ~/GolandProjects/Practice_01' # cd's into a place to practice coding in Go
alias ghost='cd /opt/ğɧØƨŦ' # Custom hacker tools n stuff
alias seclists='cd /opt/ğɧØƨŦ/seclists' # Custom SecLists files
alias wifidown='ifconfig wlp4s0 down' # take down the wifi interface
alias tedcreds='cat .mongodb-ted-url-creds.txt' # mongoDB creds for a test user
alias todo='cd Templates/ToDo' # check out a to-do list
alias uza='unzip *' # unzips all files in the pwd

# This one lists the contensts of a directory and lists only the names of the files and folders.
# It cuts out all this:  -File permissions     user    last edit date
# ......................-rw-r--r-- 1 linux linux  325 Sep  1 19:59 
alias lsawk="ls -l | awk '{print \$9}'" 

# Alias creation template
# alias cmd=' '
# alias cmd=' '
# alias cmd=' '

# Custom commands & scripts I placed in /usr/bin
# These can be used like aliases and can all be found in:
# https://github.com/LinuxUser255/BashAndLinux/tree/main/UsrBin

# Do NOT uncomment these or else they will run everytime you open the terminal.
# xmrlert.........Python script that fetches real-time price on Monero in USD
# https://github.com/LinuxUser255/Monero_Extras 
# headers..........Print a List of HTTP request headers.
# xfh..............List of X-Forwarded for headers.
# stealcookies.....XSS exploit code to steal cookies.
# space............Double spaces lines of a text file.
# remap............Remaps caps lock to the escape key.
# new..............prints a list of newly created commands and aliases I made. Check it out here:


# Paths & tools
# --------------

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh Syntax highlighting
source /home/linux/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Postman
export PATH=$PATH:/usr/bin/Postman

# Go Lang  Enviroment path
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
