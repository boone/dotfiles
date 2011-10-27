call pathogen#infect()
syntax on
filetype plugin indent on
set number
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let mapleader = " "

nnoremap <Leader>s :Gstatus<Enter>
nnoremap <Leader>c :Gcommit<Enter>
