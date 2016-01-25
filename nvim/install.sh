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

# Find or make XDG config folder ~/.config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

NVIM_SRC=$(fullpath nvim)
NVIM_DEST="$XDG_CONFIG_HOME/nvim"

# Check if ~/.config/nvim exists or is a symbolic link alrady
if [ -e $NVIM_DEST ] || [ -L $NVIM_DEST ] ; then
  confirm "$NVIM_DEST exists. Replace it? [y/N]:" && rm -rf $NVIM_DEST && ln -s $NVIM_SRC $NVIM_DEST
else
  ln -s $NVIM_SRC $NVIM_DEST
fi
