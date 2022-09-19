# ~/.zshrc file for zsh interactive shells.
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#neofetch #| lolcat
#date
#xmrlert

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="awesomepanda"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages)
#plugins=(alias-finder)
#plugins=(pass)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
EDITOR='nvim'
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
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

# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias config="mate cd ~/.config/nvim"
# # some more ls aliases
alias l='ls'
alias ll='ls -l'
alias lla='ls -la'

# Search a directory
alias lll='fastgrep'

# shortcuts and custom scripts
alias v='nvim'
alias n='nvim'
alias s='sudo su'
alias e='exit'
alias q='exit'
alias c='cat'
alias b='bat'
alias pip='pip3'
alias python='python3.10'
alias p='pass'
alias pa='pass add'
alias xmrig='cd Downloads/xmrig-6.15.2'
alias up='sudo apt update;sudo apt upgrade'
alias inst='sudo apt install'
alias sup='sudo apt update'
alias vb='vim .bashrc'
alias nn='nvim .zshrc'
alias bb='bat .zshrc'
alias web='cd Documents/Web/WebAppLabs'
alias late='ls -lt | head -n 3'

# Web Browsers
alias tor='cd Downloads/tor-browser_en-US;./start-tor-browser.desktop'
alias brave="brave-browser"
alias bbb='cd /opt/BurpSuitePro;./BurpSuitePro'
alias ude='cd Downloads/Udemy'
alias uza='unzip *'
# IDEs
alias pycharm='cd /opt/pycharm-community-2021.3.1/bin;./pycharm.sh'
alias idea='cd Downloads/idea-IC-222.3739.54/bin;./idea.sh'
alias gol='cd Downloads/GoLand-2022.2.2/bin;./goland.sh'

# Custom scripts and aliases
alias xmr='cd Downloads/monero-gui-v0.18.1.0;./monero-wallet-gui'
alias btc='cd Downloads/Electrum-4.3.1;./run_electrum'
alias web='cd Documents/Web/WebAppLabs/'
alias ifconfig='sudo ifconfig'
alias iwconfig='sudo iwconfig'
#alias ppp='psearch'
alias a='alacritty msg create-window'
alias aa-'alacritty --working-directory'
alias space='pr -d -t '
alias ufw='sudo ufw'
alias fdisk='sudo fdisk -l'
alias lsnum='ls -l -v'
alias vv='vim .vimrc'
alias ran='ranger'
alias yt='yt-dlp '
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source /home/${USER}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# export PATH="$PATH:/usr/bin/Postman"
# export PATH=$PATH:$(go env GOPATH)/bin
