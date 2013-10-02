function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%F{178}(ssh %n@%m)%f "
  fi
}

function virtualenv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    echo "%F{178}(venv)%f "
  fi
}

function prompt_omh_precmd {
  vcs_info
}

function prompt_omh_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  # Add hook for calling vcs_info before each command.
  add-zsh-hook precmd prompt_omh_precmd

  zstyle ':vcs_info:*' enable bzr git hg svn
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' stagedstr '%F{green} ●%f'
  zstyle ':vcs_info:*' unstagedstr '%F{220} ●%f'
  zstyle ':vcs_info:*' formats ' %F{238}(%F{105}%b%c%u%F{238})%f'
  zstyle ':vcs_info:*' actionformats " %F{238}(%F{105}%b%c%u%F{238}|%F{yellow}%a%f%F{238})%f"
  zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b|%F{57}%r%f'
  zstyle ':vcs_info:git*+set-message:*' hooks git-status

  autoload -U colors && colors
  VIRTUAL_ENV_DISABLE_PROMPT=1
  PROMPT='$(virtualenv)$(ssh_connection)%F{238}%3~%f${vcs_info_msg_0_} %F{yellow}%(!.#.❯)%b%f '
  SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
}
