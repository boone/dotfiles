
#!/usr/bin/env bash

echo "Setting up VIM"
echo "  Creating symlinks..."

symlinks=( vim vimrc )

for link in ${symlinks[@]}; do
  target="`pwd`/${link}"
  link_name="${HOME}/.${link}"
  if ! [[ -L $link_name ]]; then
    echo "    LINK - ${link_name} | TARGET - ${target}"
    ln -s $target $link_name
  else
    echo "    SKIP - ${link_name}"
  fi
done

echo

if ! [[ -d `pwd`/vim/bundle/vundle/.git  ]]; then
  echo "  Cloning Vundle..."
  git clone https://github.com/gmarik/vundle.git `pwd`/vim/bundle/vundle
else
  echo "  Skipping Vundle clone"
fi

vim +BundleInstall +qall
vim +BundleClean +qall

echo

echo "Setting up bash environment"

bash_files=( bash bashrc gitconfig )

for link in ${bash_files[@]}; do
  target="`pwd`/${link}"
  link_name="${HOME}/.${link}"
  if ! [[ -L $link_name ]]; then
    echo "    LINK - ${link_name} | TARGET - ${target}"
    ln -s $target $link_name
  else
    echo "    SKIP - ${link_name}"
  fi
done

source $HOME/.bashrc
