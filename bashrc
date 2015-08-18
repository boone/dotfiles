source $HOME/.bash/aliases.sh
source $HOME/.bash/osx.sh
source $HOME/.bash/defaults.sh

source $HOME/.git-prompt.sh

for file in ~/.bash/custom/*; do
  if [ -f "$file" ] ; then
    source $file
  fi
done

if [ -d ~/.rbenv ]; then
  eval "$(rbenv init -)"
fi
