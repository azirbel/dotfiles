#!/bin/bash

# Copied from https://github.com/toranb/dotfiles/blob/master/symlink.sh
# Thanks toranb!

##
# You must delete all existing *zsh*, *vim* and *tmux* files and directories
# in your home folder for these new files to work
##
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.viminfo > /dev/null 2>&1
sudo rm -rf ~/.vim > /dev/null 2>&1

# Symlink the new config files.
DOTFILES_DIR="/Users/alex/projects/dotfiles"
ln -s "$DOTFILES_DIR/vim" ~/.vim
ln -s "$DOTFILES_DIR/vimrc" ~/.vimrc

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"
