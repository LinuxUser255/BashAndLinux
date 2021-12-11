" My Vimrc

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set nohlsearch
set noshowmode
set termguicolors
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
