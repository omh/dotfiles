#!/bin/sh

# zsh
brew install zsh

# macvim
brew install macvim

# proper vim with ruby support
brew install https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb

# Set up local symlink for 'vi'.
sudo ln -s /usr/local/bin/vim /usr/local/bin/vi

# rbenv + ruby-build
brew install rbenv
brew install ruby-build

# tig - git browser
brew install tig

# ctags
brew install ctags

# ack 
brew install ack

# https://github.com/tpope/gem-ctags
gem install gem-ctags

# https://github.com/tpope/gem-ctags
gem install gem-ctags

