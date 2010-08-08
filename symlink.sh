#!/bin/bash

rm -fr ~/.vim
rm -f ~/.vim
ln -sf `pwd`/vim ~/.vim
ln -sf `pwd`/vimrc ~/.vimrc 
ln -sf `pwd`/gvimrc ~/.gvimrc

# Generate help tags
vim -c "call pathogen#helptags() | :q"

cd ~/.vim/bundle/commandt/
rake make

