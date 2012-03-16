# Requirements #

VIM >= 7.2.

This repo requires Janus and oh-my-zsh. These can be installed like this:

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    curl -Lo- http://bit.ly/janus-bootstrap | bash

# Installation #

Please note that running ./symlink.sh will **delete** any existing ~/.vim/, ~/.vimrc and ~/.gvimrc. 
**You have been warned.**

    git clone git://github.com/omh/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./symlink.sh

