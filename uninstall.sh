#!/usr/bin/env bash

echo "Removing symlinks..."

symlinks=( vimrc vim )
for link in ${symlinks[@]}; do
  link="${HOME}/.${link}"
  if ! [[ -L $link ]]; then
    echo "  LINK DOES NOT EXIST - ${link}"
  else
    echo "  REMOVING - ${link}"
    rm $link
  fi
done
