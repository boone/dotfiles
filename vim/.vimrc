call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible


"Git
set statusline+=%{fugitive#statusline()}

set number
set ignorecase
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let mapleader = " "

nnoremap <Leader>s :Gstatus<Enter>
nnoremap <Leader>c :Gcommit<Enter>

