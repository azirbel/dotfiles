#!/bin/bash

if [ -e ~/.vimrc ]; then
  echo "~/.vimrc exists; aborting."
  return
fi
if [ -e ~/.vim ]; then
  echo "~/.vim exists; aborting."
  return
fi

ln -s .vimrc ~/.vimrc 
ln -s . ~/.vim

echo "Success."
