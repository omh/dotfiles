#!/bin/bash

ln -sf `pwd`/tmux.conf ~/.tmux.conf

mkdir -p ~/.config
ln -sf `pwd`/nvim ~/.config/nvim
ln -sf `pwd`/ghostty ~/.config/ghostty
