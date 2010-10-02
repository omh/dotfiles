# Requirements #

VIM >= 7.2.

This repo includes the excellent Command-T plugin that requires ruby support in VIM and 'make' to be installed.
If you're using Mac OS X make sure you have the developer tools installed first.

# Installation #

Please note that running ./symlink.sh will **delete** any existing ~/.vim/, ~/.vimrc and ~/.gvimrc. 
**You have been warned.**

    $ git clone git://github.com/omh/vimrc.git ~/.gitvim
    $ cd ~/.gitvim
    $ git submodule init
    $ git submodule update
    # Make sure ~/.vim, ~/.vimrc and ~/.gvimrc are backed up, they will be deleted.
    $ ./symlink.sh

