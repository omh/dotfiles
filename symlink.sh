#!/bin/bash

git submodule init
git submodule update

ln -sf `pwd`/vim ~/.janus
ln -sf `pwd`/vimrc.before ~/.vimrc.before
ln -sf `pwd`/vimrc.after ~/.vimrc.after
ln -sf `pwd`/gvimrc.after ~/.gvimrc.after
ln -sf `pwd`/zshrc ~/.zshrc
ln -sf `pwd`/oh-my-zsh ~/.oh-my-zsh
