#!/bin/bash

rm ~/.vim/scripts/temp.txt > /dev/null 2>&1

GIT_ROOT=`git rev-parse --show-cdup`
git grep -2 -n --heading $1 $GIT_ROOT > ~/.vim/scripts/temp.txt

~/.vim/scripts/parse-grep.py ~/.vim/scripts/temp.txt

