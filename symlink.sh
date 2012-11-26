#!/bin/bash

git submodule update --init --recursive

# Zsh and Prezto
ln -sf `pwd`/prezto ~/.zprezto
ln -sf `pwd`/zshrc ~/.zshrc
ln -sf `pwd`/zpreztorc ~/.zpreztorc

# Vim
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/gvimrc ~/.gvimrc

# Misc
ln -sf `pwd`/gemrc ~/.gemrc

touch ~/.hushlogin
