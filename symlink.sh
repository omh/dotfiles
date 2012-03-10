#!/bin/bash

git submodule init
git submodule update

rm -fr ~/.vim
rm -f ~/.vim
ln -sf `pwd`/vim ~/.vim
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/gvimrc ~/.gvimrc
ln -sf `pwd`/zshrc ~/.zshrc
ln -sf `pwd`/oh-my-zsh ~/.oh-my-zsh

# Generate help tags
vim -c "call pathogen#helptags() | :q"

cd ~/.vim/bundle/commandt/
rake make

