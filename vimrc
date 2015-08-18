set shell=/bin/bash
set noshelltemp
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"plugin manager
Bundle 'gmarik/vundle'

"syntax highlight and helpers
Bundle "vim-ruby/vim-ruby"
"status line for vim
Bundle 'Lokaltog/vim-powerline'
Bundle 'bufexplorer.zip'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'kien/ctrlp.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'pangloss/vim-javascript'
"comments
Bundle 'scrooloose/nerdcommenter'
"file tree
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "kien/rainbow_parentheses.vim"
Bundle "tpope/vim-surround"
Bundle "croaker/mustang-vim"
Bundle "godlygeek/tabular"
Bundle 'thoughtbot/vim-rspec'
Bundle "rking/ag.vim"
Bundle "mattn/emmet-vim"
Bundle "ervandew/supertab"
Bundle "stefanoverna/vim-i18n"
Bundle "tmhedberg/matchit"
Bundle "ecomba/vim-ruby-refactoring"

set encoding=utf-8
set t_Co=256
syntax on

let g:NERDTreeWinPos = "right"
let NERDTreeChDirMode=2

let mapleader = ","

" filetype plugin indent on
" Show a brighter cursorline
let g:jellybeans_overrides = {
      \    'CursorLine': { 'guifg': '',   'guibg': '444444',
      \                    'ctermfg': '', 'ctermbg': '000000',
      \                    'attr': '' },
      \}

"Git
set statusline+=%{fugitive#statusline()}

let g:rspec_command = "!spin push {spec}"
map <Leader>g :call RunCurrentSpecFile()<CR>

set hidden
set number
set ignorecase
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab

set go-=T "hide toolbar
set directory=/tmp

nmap <leader>r :bufdo e!<cr>

" Fast saving
" nmap <leader>s :w!<cr>
nmap <leader>q :wq<cr>

autocmd BufWritePre * :%s/\s\s\+$//e

" Fast editing of the .vimrc
map <leader>r :e! ~/.vimrc<cr>
" Fast editing of the .bash_profile
map <leader>p :e! ~/.bash_profile<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

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

"Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

"to use ack `
"nnoremap <Leader>a <Esc>:Ack

"nnoremap <Leader>s :Gstatus<Enter>
nnoremap <Leader>m :Gcommit<Enter>
nnoremap <Leader>t :CtrlP<Enter>

" Close all other windows, open a vertical split, and open this file's test
" alternate in it.
nnoremap <leader>s :call FocusOnFile()<cr>
function! FocusOnFile()
  tabnew %
  normal! v
  normal! l
  call OpenTestAlternate()
  normal! h
endfunction

 autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

nnoremap <Leader>b :BufExplorer<Enter>
" Focus on nerdtree
"map <silent> <C-m> :NERDTreeFocus<CR>
map <C-n> :NERDTreeToggle<CR>

"Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

 let g:ctrlp_working_path_mode = 'rw'

nnoremap <leader>n :tabNext<Enter>
"split a vertical window and go for it
nnoremap <leader>w <C-w>v<C-w>l
noremap <leader>/ :tabe ~/dotfiles/vim/snippets/ruby.snippets<cr>
noremap <leader>// :tabe ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<cr>
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

" open quickfix and some movements
nnoremap <C-j> :cnext<Enter>
nnoremap <C-k> :cprev<Enter>

" colorscheme solarized
colorscheme mustang
" colorscheme codeschool
highlight LineNr ctermfg=grey

set autowrite
set autowriteall
au FocusLost * :wa
au BufNewFile,BufRead *.less set filetype=less
set rnu

" Yaml
au BufNewFile,BufRead *.yaml,*.yml    setf yaml

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
autocmd BufNewFile,BufRead *.scss  set ft=scss.css

au FocusLost * :wa
au BufWrite * :call DeleteTrailingWS()

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

"auto source vic
map <leader>vimrc :tabe ~/.vimrc<cr>
au! BufWritePost .vimrc source %

if exists(":Tabularize")
  nmap <leader>f=  :Tabularize /=<CR>
  vmap <leader>f=  :Tabularize /=<CR>
  nmap <leader>f=> :Tabularize /=><CR>
  vmap <leader>f=> :Tabularize /=><CR>
  nmap <leader>f:  :Tabularize /:\zs<CR>
  nmap <leader>f:  :Tabularize /:\zs<CR>
  nmap <leader>f{  :Tabularize /{<CR>
  nmap <leader>f{  :Tabularize /{<CR>
endif

" Multipurpose TAB key
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('. ')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<reporters\>') != -1 || match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    " if in_app - nossas apps
    let new_file = substitute(new_file, '^app/', '', '')
    " end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
    if filereadable(new_file)
      let new_file = new_file
    else
      " helix_core stuff
      let new_file = substitute(new_file, 'lib/', '', '')
    endif
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
    if filereadable(new_file)
      let new_file = new_file
    else
      " helix_core stuff
      let new_file = substitute(new_file, 'helix_core/', 'lib/helix_core/', '')
    endif
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
nnoremap <leader>c :w\|:!script/features<cr>
"nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        " First choice: project-specific test script
        if filereadable("script/test")
           exec ":!script/test " . a:filename
        " spin
        elseif filereadable(".spin.rb")
          exec ":!spin push " . a:filename
        " Fall back to the .test-commands pipe if available, assuming someone
        " is reading the other side and running the commands
        elseif filewritable(".test-commands")
          let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
          exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

          " Write an empty string to block until the command completes
          sleep 100m " milliseconds
          :!echo > .test-commands
          redraw!
        " Fall back to a blocking test run with Bundler
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        " Fall back to a normal blocking test run
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff tab management: open the current git diff in a tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

" Dic
"nmap <silent> <Leader>d :!open dict://<cword><CR><CR>
set formatoptions-=cro
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

function! Gotocore()
  cd ~/source/site5/helix_core
  NERDTree ~/source/site5/helix_core
  CtrlPClearAllCaches
endfunction

function! Gotohelix()
  cd ~/source/site5/helix
  NERDTree ~/source/site5/helix
  CtrlPClearAllCaches
endfunction

function! Gotobackstage()
  cd ~/source/site5/backstage
  NERDTree ~/source/site5/backstage
  CtrlPClearAllCaches
endfunction

function! Gotoorder()
  cd ~/source/site5/event_horizon
  NERDTree ~/source/site5/event_horizon
  CtrlPClearAllCaches
endfunction

function! Gotowormhole()
  cd ~/source/site5/wormhole
  NERDTree ~/source/site5/wormhole
  CtrlPClearAllCaches
endfunction

"open Marked
nnoremap <leader>0 :exec ":!open -a Marked " . expand('%:p')<cr>

nnoremap <leader>1 :call Gotocore()<cr>
nnoremap <leader>2 :call Gotohelix()<cr>
nnoremap <leader>3 :call Gotobackstage()<cr>
nnoremap <leader>4 :call Gotoorder()<cr>
nnoremap <leader>5 :call Gotowormhole()<cr>
vmap <Leader>z :call I18nTranslateString()<CR>
autocmd VimEnter * echo ">^.^<"

" to also copy to clipboard
set clipboard=unnamed

if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

nmap <Leader>b :NERDTreeFind<CR>
