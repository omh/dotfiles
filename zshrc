# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

  # Set up theme
  source ~/.dotfiles/zsh/theme.zsh
  prompt_omh_setup "$@"
fi


# Disable autocomplete
unsetopt correct_all

# Auto complete with colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Customize path
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Set editor
export EDITOR="vim"
if [[ -n $SSH_CONNECTION ]]; then
else
    export EDITOR="mvim -v"
    alias vi="mvim -v"
    alias vim="mvim -v"
fi

# Better colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Custom aliases
alias m="mvim --remote"
alias ff="find . -not -path '*.git*'|grep -i "
alias grep="grep --color"
# Grep highlighting color
export GREP_COLOR='0;35;31'

# Load rbenv
if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi

# Tweak ruby GC to better suite rails apps - makes start up faster.
export RUBY_HEAP_MIN_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000

# Load git helpers if available
if [ -f ~/.git_helpers/helpers.sh ]; then
    source ~/.git_helpers/helpers.sh
fi

# GPG agent
local GPG_ENV=$HOME/.gnupg/gpg-agent.env

function start_agent_nossh {
    eval $(/usr/bin/env gpg-agent --quiet --daemon --write-env-file ${GPG_ENV} 2> /dev/null)
    chmod 600 ${GPG_ENV}
    export GPG_AGENT_INFO
}

function start_agent_withssh {
    eval $(/usr/bin/env gpg-agent --quiet --daemon --enable-ssh-support --write-env-file ${GPG_ENV} 2> /dev/null)
    chmod 600 ${GPG_ENV}
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
}

# check if another agent is running
if ! gpg-connect-agent --quiet /bye > /dev/null 2> /dev/null; then
    # source settings of old agent, if applicable
    if [ -f "${GPG_ENV}" ]; then
        . ${GPG_ENV} > /dev/null
        export GPG_AGENT_INFO
        export SSH_AUTH_SOCK
        export SSH_AGENT_PID
    fi

    # check again if another agent is running using the newly sourced settings
    if ! gpg-connect-agent --quiet /bye > /dev/null 2> /dev/null; then
        # check for existing ssh-agent
        if ssh-add -l > /dev/null 2> /dev/null; then
            # ssh-agent running, start gpg-agent without ssh support
            start_agent_nossh;
        else
            # otherwise start gpg-agent with ssh support
            start_agent_withssh;
        fi
fi
fi

GPG_TTY=$(tty)
export GPG_TTY

# Pass auto completes
fpath=(~/.dotfiles/zsh/pass.zsh-completion $fpath)
autoload -Uz compinit
compinit

export PASSWORD_STORE_DIR=~/Dropbox/.password-store

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
