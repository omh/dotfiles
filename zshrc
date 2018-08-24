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
#alias ff="find . -not -path '*.git*' - "
function ff() 
{
    # pipe to grep to get color highlight of the filename
    find . -not -path '*.git*' -iname "*$1*" | grep -i "$1"
}
alias pack="ack --type=python"
alias grep="grep --color"
# Grep highlighting color
export GREP_COLOR='0;35;31'

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

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oh/dev/kube-django/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/oh/dev/kube-django/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oh/dev/kube-django/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/oh/dev/kube-django/google-cloud-sdk/completion.zsh.inc'; fi
