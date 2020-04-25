eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true

export PYENV_ROOT="$HOME/.pyenv"
export ZSH_PYENV_LAZY_VIRTUALENV=true

fpath=(
  $fpath
  $HOME/.zfunc
)

path=(
  $path
  $PYENV_ROOT/bin
  $HOME/.cargo/bin
  $HOME/.poetry/bin
  $HOME/.toolbox
)

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  poetry
  zsh-nvm
  pyenv
  pyenv-lazy
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsecrets
source $HOME/.zalias

autoload -Uz ~/.zfunc/**/*
autoload -Uz compinit && compinit
