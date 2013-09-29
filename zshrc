# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

  # Set up theme
  source ~/.dotfiles/zsh/theme.zsh
  prompt_omh_setup "$@"
fi


# Disable autocomplete
unsetopt correct_all

# Customize path
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Set editor
alias vim="mvim -v"
alias vi=vim
export EDITOR="mvim -v"

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
