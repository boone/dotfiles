call pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = " "

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


nnoremap <Leader>s :Gstatus<Enter>
nnoremap <Leader>c :Gcommit<Enter>
nnoremap <Leader>r :CommandTFlush<Enter>

"split a vertical window and go for it
nnoremap <leader>w <C-w>v<C-w>l
"to move around the windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"to use ack `
let g:ackprg="ack-grep -H --nocolor --nogroup --column -ia" 
nnoremap <Leader>a <Esc>:Ack 
