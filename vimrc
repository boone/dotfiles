set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Vundle
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-haml'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'bufexplorer.zip'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'lunaru/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
set encoding=utf-8

syntax on
" Show a brighter cursorline
set term=screen-256color


filetype plugin indent on
" Show a brighter cursorline
let g:jellybeans_overrides = {
      \    'CursorLine': { 'guifg': '',   'guibg': '444444',
      \                    'ctermfg': '', 'ctermbg': '000000',
      \                    'attr': '' },
      \}

"Git
set statusline+=%{fugitive#statusline()}

"SyuperTab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

set hidden
set number
set ignorecase
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab

set go-=T "hide toolbar
set directory=/tmp

"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nmap <leader>r :bufdo e!<cr>

" Fast saving
" nmap <leader>s :w!<cr>
nmap <leader>q :wq<cr>

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

nnoremap <Leader>s :Gstatus<Enter>
nnoremap <Leader>m :Gcommit<Enter>
nnoremap <Leader>t :CtrlP<Enter>


nnoremap <Leader>b :BufExplorer<Enter>

nnoremap <Leader>c :NERDTreeClose<Enter>
nnoremap <Leader>n :NERDTree<Enter>

"split a vertical window and go for it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h :split<Enter><C-w>j
"to move around the windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" allow backspacing over everything in insert mode
set backspace=2

syntax enable
set background=dark
set bg=dark

" Git grep

func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

" run git grep on the word under the cursor
func GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endf
nmap <C-f> :call GitGrepWord()<CR>

" open quickfix and some movements
nnoremap <C-n> :cnext<Enter>
nnoremap <C-a> :cprev<Enter>

" colorscheme solarized
colorscheme jellybeans
highlight LineNr ctermfg=grey

set autowrite
set autowriteall
au FocusLost * :wa
au BufNewFile,BufRead *.less set filetype=less
set rnu

autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

au BufRead,BufNew *.coffee set ft=coffee
au BufRead,BufNew *.ru set ft=ruby
au BufRead,BufNew *.rb set ft=ruby
au BufRead,BufNew *.html.erb set ft=eruby.html
au BufRead,BufNew Vagrantfile set ft=ruby
au BufRead,BufNew Gemfile set ft=ruby
au BufRead,BufNew Guardfile set ft=ruby
au BufRead,BufNew Procfile set ft=ruby
au BufRead,BufNew *.json set ft=javascript

au FocusLost * :wa
au BufWrite * :call DeleteTrailingWS()

autocmd BufNewFile,BufRead *.scss             set ft=scss.css
set omnifunc=csscomplete#CompleteCSS

" powerline
let g:Powerline_symbols = 'fancy'

" status line
" display a warning if file encoding isnt utf-8
set statusline=
set statusline=[%n]             "buffer number
set statusline+=\ \%#warningmsg#
" set the format of the status line
set statusline+=%*
set statusline+=%f              "filename
set statusline+=%m              "modified flag
set statusline+=%r              "read only flag
set statusline+=\ \%y           "filetype
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%=              "left/right separator
set statusline+=%*              "show the errors/warning in the status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=              "left/right separator
set statusline+=%h\ \           "help file flag
set statusline+=[%l,%c]         "cursor line,column
set statusline+=\ \|%L\ lines\| "total lines
set statusline+=\ %P            "percent through file
set laststatus=2

