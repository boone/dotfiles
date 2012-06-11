call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

"Git
set statusline+=%{fugitive#statusline()}

set hidden
set number
set ignorecase
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab

set go-=T "hide toolbar
set directory=/tmp

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"syntax check
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

" Fast saving
nmap <leader>s :w!<cr>
nmap <leader>q :q!<cr>

autocmd BufWritePre * :%s/\s\s\+$//e

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>
" Fast editing of the .bash_profile
map <leader>p :e! ~/.bash_profile<cr>

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" disabling the arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" Always hide the statusline
set laststatus=2

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

"to use ack `
nnoremap <Leader>a <Esc>:Ack

" nnoremap <Leader>s :Gstatus<Enter>
nnoremap <Leader>c :Gcommit<Enter>
nnoremap <Leader>f :CommandTFlush<Enter>


nnoremap <Leader>b :BufExplorer<Enter>

nnoremap <Leader>c :NERDTreeClose<Enter>
nnoremap <Leader>n :NERDTree<Enter>

"split a vertical window and go for it
nnoremap <leader>w <C-w>v<C-w>l
"to move around the windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" allow backspacing over everything in insert mode
set backspace=2

syntax enable
set background=dark
colorscheme solarized
set autowrite
set autowriteall
au FocusLost * :wa
au BufNewFile,BufRead *.less set filetype=less
set rnu

autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

au BufRead,BufNew *.coffee set ft=coffee
au BufRead,BufNew *.ru set ft=ruby
au BufRead,BufNew *.html.erb set ft=eruby.html
au BufRead,BufNew Vagrantfile set ft=ruby
au BufRead,BufNew Gemfile set ft=ruby
au BufRead,BufNew Guardfile set ft=ruby
au BufRead,BufNew Procfile set ft=ruby
au BufRead,BufNew *.json set ft=javascript

au FocusLost * :wa
au BufWrite * :call DeleteTrailingWS()
