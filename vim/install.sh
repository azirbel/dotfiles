#!/bin/bash

# Generic confirm function from http://stackoverflow.com/a/3232082
# Defaults to no
confirm() {
  # Call with a prompt string or use a default
  read -r -p "${1:-Are you sure? [y/N]} " response
  case $response in
    [yY][eE][sS]|[yY]) 
      true
      ;;
    *)
      false
      ;;
  esac
}

# http://stackoverflow.com/a/21188136
fullpath() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

VIMRC=$(fullpath vimrc)
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ] ; then
  confirm "~/.vimrc exists. Replace it? [y/N]:" && rm ~/.vimrc && ln -s $VIMRC ~/.vimrc
else
  ln -s $VIMRC ~/.vimrc 
fi

DOTVIM=$(fullpath dotvim)
if [ -e ~/.vim ] || [ -L ~/.vim ] ; then
  confirm "~/.vim exists. Replace it? [y/N]:" && rm -rf ~/.vim && ln -s $DOTVIM ~/.vim
else
  ln -s $DOTVIM ~/.vim
fi
