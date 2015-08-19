#!/usr/bin/env bash

echo "Removing symlinks..."

symlinks=( vimrc vim )
for link in ${symlinks[@]}; do
  link="${HOME}/.${link}"
  if ! [[ -L $link ]]; then
    echo "  link does not exist - ${link}"
  else
    echo "  removing - ${link}"
    rm $link
  fi
done

echo "Removin custom bin files"
for file in ~/.bash/bin/*; do
  filename=`basename "$file"`
  if [ -f /usr/local/bin/$filename ] ; then
    echo "  removing $filename bin"
    rm /usr/local/bin/$filename
  else
    echo "  link does not exist - /usr/local/bin/$filename"
  fi
done

echo "Removing bash files"
bash_files=( bash bashrc gitconfig gitignore git-prompt.sh )
for link in ${bash_files[@]}; do
  link="${HOME}/.${link}"
  if ! [[ -L $link ]]; then
    echo "  link does not exist - ${link}"
  else
    echo "  removing - ${link}"
    rm $link
  fi
done
