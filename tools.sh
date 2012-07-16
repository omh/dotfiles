#!/bin/sh

# Create SSH key if one does not exist
[[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa

# Brew
/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

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

# watch
brew install watch


# https://github.com/tpope/gem-ctags
gem install gem-ctags

# https://github.com/tpope/gem-browse
gem install gem-browse

gem install rails
gem install heroku
gem install pg
gem install foreman
