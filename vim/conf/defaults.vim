set shell=/bin/bash

colorscheme mustang

set noshelltemp
set nocompatible
set encoding=utf-8
set t_Co=256
set hidden
set number
set ignorecase
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
"hide toolbar
set go-=T
set directory=/tmp
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Always hide the statusline
set laststatus=2
"Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile
" allow backspacing over everything in insert mode
set backspace=2
set background=dark
set bg=dark
set autowrite
set autowriteall
set rnu
set formatoptions-=cro
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

filetype off
syntax on
syntax enable

set statusline+=%{fugitive#statusline()}
" to also copy to clipboard
set clipboard=unnamed

" CTRLP
let g:ctrlp_working_path_mode = 'rw'
