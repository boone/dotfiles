
" Fast saving
" nmap <leader>s :w!<cr>
nmap <leader>q :wq<cr>
" Fast editing of the .vimrc
map <leader>r :e! ~/.vimrc<cr>
" Reload vimrc
map <leader>z :source ~/.vimrc<cr>
" Fast editing of the .bash_profile
map <leader>p :e! ~/.bash_profile<cr>
" Quickly run the current spec file
map <Leader>g :call RunCurrentSpecFile()<CR>
" Quickly open a file in the current directory
map <leader>e :edit %%

nnoremap <Leader>b :BufExplorer<Enter>
nnoremap <leader>n :tabNext<Enter>
"split a vertical window and go for it
nnoremap <leader>w <C-w>v<C-w>l
noremap <leader>/ :tabe ~/dotfiles/vim/snippets/ruby.snippets<cr>
noremap <leader>// :tabe ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<cr>
nnoremap <leader>h :split<Enter><C-w>j

" open quickfix and some movements
" TODO this mapping is colliding with the belo one. fix it.
"nnoremap <C-j> :cnext<Enter>
"nnoremap <C-k> :cprev<Enter>

"to move around the windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Git
nnoremap <Leader>m :Gcommit<Enter>
nnoremap <Leader>t :CtrlP<Enter>

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

" disabling the arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
