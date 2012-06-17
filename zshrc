# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="nebirhos"
#ZSH_THEME="sorin"
#ZSH_THEME="gallifrey"
ZSH_THEME="kennethreitz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby bundler gem brew rvm pow cap zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Disable autocomplete
unsetopt correct_all

# Customize to your needs...
export PATH="/usr/local/bin:/Users/oh/.rvm/bin:$PATH"

bindkey ^r  history-incremental-search-backward
setopt hist_ignore_all_dups
bindkey -e

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

LSCOLORS="fxfxcxdxbxegedabagacad"

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

eval "$(rbenv init -)"
