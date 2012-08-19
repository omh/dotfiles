# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kennethreitz"
ZSH_THEME="omh"

COMPLETION_WAITING_DOTS="true"

plugins=(heroku brew)

source $ZSH/oh-my-zsh.sh

# Disable autocomplete
#unsetopt correct_all

# Customize to your needs...
export PATH="/usr/local/bin:$PATH"

bindkey ^r  history-incremental-search-backward
setopt hist_ignore_all_dups
bindkey -e

LSCOLORS="dxfxcxdxbxegedabagacad"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
alias rm="rm -i"
alias cp="cp -iv"
alias mv="mv -iv"
alias grep="grep --colour"
alias ls="ls -FG"
alias r="rails"
alias tree="tree -AC"
alias b="bundle exec"
alias m="mvim --remote"
alias ff="find . |grep -i "

eval "$(rbenv init -)"

# Tweak ruby GC to better suite rails apps - makes start up faster.
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
