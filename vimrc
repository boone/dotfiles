source $HOME/.vim/conf/defaults.vim
source $HOME/.vim/conf/plugins.vim
source $HOME/.vim/conf/functions.vim
source $HOME/.vim/conf/maps.vim
source $HOME/.vim/conf/auto.vim
source $HOME/.vim/conf/nerd.vim
source $HOME/.vim/conf/statusline.vim

for f in split(glob('~/.vim/conf/custom/*'), '\n')
  exec 'source' f
endfor
