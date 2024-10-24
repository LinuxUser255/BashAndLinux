# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Auto remap Caps lock to Esc upon shell launch. And it also speeds xset.
remap

# Speed up the cursor & scrolling system wide
# xset r rate 380 80
fast

# Print sytem info like neofetch:
# Very Fast. No lag time

# Easy install, build from source instructions here:
# https://github.com/fastfetch-cli/fastfetch/wiki/Building

# uncomment fastfetch below if you want it to lauch with every new terminal
# fastfetch

# Set name of the oh-my-zsh theme to load --- if set to "random", it will launch random themes
ZSH_THEME="jispwoso"
# ZSH_THEME="robbyrussell" # <- the default one

#------------- Custom Prompt & Colour Explained --------------------#

# Prompt Config File Colour Customization:
# Located at: /home/linux/.oh-my-zsh/themes
# Theme name: jispwoso.zsh-theme
#
# This config sets the user@machine prompt to red
# And the PWD font to Cyan
# 
# local ret_status="%(?:%{$fg_bold[red]%}➜ :%{$fg_bold[red]%}➜ %s)" 
#
# The PROMPT [color] defines the color of your linux@debian.   # this fg_bold defines the dir path
# The PROMPT below makes linux@debion red and the pwd cyan. And the bit about the git prompt is for when you are in a git repo/dir
# PROMPT=$'%{$fg[red]%}%n@%m: %{$reset_color%}%{$fg[cyan]%}%/ %{$reset_color%}%{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
# ${ret_status} %{$reset_color%} '
#
# PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"
#
# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}" # <-- this has been changed to red also
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}) %{$fg[yellow]%}✗%{$reset_color%}" # <-- changed to red 
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%})" # <--changed to red

# ------ End of Prompt Config Colour Customization ----------- #

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
# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '

# List only the Directories
# alias lsdir='ls -l | awk "{print \$9}"'

# Same as above, but output the Directory names in bold red font
alias lsdir='ls -l | awk "{print \"\033[1;31m\"\$9\"\033[0m\"}"'

# Searching a directory
alias lll='fastgrep'
alias LLL='fastgrep'

# Search the password store
alias ppp='pw-search'

# cmd & shortcut scripts
alias v='nvim'
alias n='nvim'
alias k='kate'
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

# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '

# start SSH_CONNECTION
alias sshstart='sudo systemctl start ssh'
alias sshstatus='sudo systemctl status ssh'
alias sshstop='sudo systemctl stop ssh'
alias space='pr -d -t '
alias ufw='sudo ufw'
alias lsnum='ls -l -v'
alias rr='ranger'
#alias lf='lf-ueberzug'
alias yt='yt-dlp '
alias yta='yt-dlp --extract-audio --audio-format mp3 '
alias lsawk="echo ls -l pipe to awk print 9th field"
alias nvconf='cd ~/.config/nvim '
alias gr='go run'
# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '

# alacritty commands
alias a='alacritty msg create-window'

#alias aa='alacritty --working-directory'
# copy pwd to clipboard
# alias cppwd='pwd | xclip;' 
# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '

# More Custom scripts
#-----------------------
alias space='space'  # Double spaces lines of a text file.
alias remap='remap'   # Remaps caps lock to the escape key.
# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '

# dot file access
alias vb='vim .bashrc'
alias vv="vim .vimrc"
alias rc='nvim ~/.zshrc'
alias nn='nvim .'
alias bb='bat ~/.zshrc'
alias late='ls -lt | head -n 10' # displays the most recent file added or edited in a directory.
alias ohmyzsh="cd ~/.oh-my-zsh"
alias nvconfig="cd ~/.config/nvim"
#alias zshconfig="mate ~/.zshrc"
# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '

# change directory shortcuts & access specific directories
alias cc='cd'
alias CC='cd'
alias down='cd ~/Downloads'
alias doc='cd ~/Documents'
alias pic='cd ~/Pictures'
alias mus='cd ~/Music'
alias vid='cd ~/Videos'
alias opt='cd /opt'
alias proj='cd ~/Projects'
alias projects='cd ~/Projects'
alias rand='cd ~/Documents/random/'
# Template for creating more aliases
# alias cmd=' '
# alias cmd=' '


# IDEs
alias idea='sh /opt/JetBrainsIDEs-All/idea-IU-242.20224.419/bin.idea.sh'
alias pycharm='sh /opt/JetBrainsIDEs-All/JetBrainsIDEs-2024/pycharm-2024.1/bin/pycharm.sh '
alias goland='sh /opt/JetBrainsIDEs-All/GoLand-2023.1.2/bin/goland.sh'
alias webstorm='sh /opt/JetBrainsIDEs-All/WebStorm-231.9011.35/bin/webstorm.sh'
alias clion='sh /opt/JetBrainsIDEs-All/clion-2023.3.4/bin/clion.sh'
alias rustrover='sh /opt/JetBrainsIDEs-All/JetBrainsIDEs-2024/RustRover-2024.1/bin/rustrover.sh'
alias phpstorm='sh /opt/JetBrainsIDEs-All/PhpStorm-231.9011.38/bin/.phpstorm.sh'

# Template for creating more aliases
# alias cmd=' '


#----- PATH additions ------------------------ #

# Uncomment the ones you download/install, otherwise leave all commented out to prevent mishaps
# I'v left only the zsh-syntax-highlighting uncommented. That's all you need at first.

# Postman to PATH
# export PATH="$PATH:/usr/bin/Postman"

# Go Lang  Env to path
# export GOPATH=$HOME/go
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# pip to path
# export PATH=$PATH:/home/linux/.local/bin

# PATH="$HOME/graudit:${PATH:+:${PATH}}"; export PATH;
# export GRDIR=/path/to/graudit/signatures

# tree sitter cli thing
# export PATH=$PATH:./node_modules/.bin

# source /lfbundle/lfbundle.zshrc
# fpath+=${ZDOTDIR:-~}/.zsh_functions

# Source Zsh Syntax highlighting
source /home/linux/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#--- end ---#

