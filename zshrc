
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true

export ZSH_PYENV_LAZY_VIRTUALENV=true

fpath=(
  $fpath
  $HOME/.zfunc
)

path=(
  $path
  /usr/local/sbin
  $HOME/.cargo/bin
  $HOME/.poetry/bin
  $HOME/.toolbox
  $HOME
  /usr/local/bin
  /usr/local/opt
  $HOME/.arkade/bin/
)

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  poetry
  zsh-nvm
  pyenv
  pyenv-lazy
  fzf
  fasd
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsecrets
source $HOME/.zalias

autoload -Uz ~/.zfunc/**/*
autoload -Uz compinit && compinit

# eval "fortune ~/fortunes"

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


eval export PATH="/Users/seonghyeon/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
