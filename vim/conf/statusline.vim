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

" filetype plugin indent on
" Show a brighter cursorline
let g:jellybeans_overrides = {
      \    'CursorLine': { 'guifg': '',   'guibg': '444444',
      \                    'ctermfg': '', 'ctermbg': '000000',
      \                    'attr': '' },
      \}
