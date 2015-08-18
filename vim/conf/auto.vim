autocmd BufWritePre * :%s/\s\s\+$//e
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

au BufNewFile,BufRead *.less set filetype=less
au FocusLost * :wa

" Filetypes
au BufNewFile,BufRead *.yaml,*.yml    setf yaml
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
"auto source vic
au! BufWritePost .vimrc source %


autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif
