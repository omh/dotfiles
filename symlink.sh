#!/bin/bash

git submodule update --init --recursive

# Zsh and Prezto
ln -sf `pwd`/prezto ~/.zprezto
ln -sf `pwd`/zshrc ~/.zshrc
ln -sf `pwd`/zpreztorc ~/.zpreztorc

# Vim
ln -sf `pwd`/vim ~/.janus
ln -sf `pwd`/vimrc.before ~/.vimrc.before
ln -sf `pwd`/vimrc.after ~/.vimrc.after
ln -sf `pwd`/gvimrc.after ~/.gvimrc.after

# Misc
ln -sf `pwd`/gemrc ~/.gemrc

touch ~/.hushlogin
