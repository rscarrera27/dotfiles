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

alias cls="clear"
alias g="git"
alias please="sudo"
alias cat="bat"

alias charm="pycharm ."
alias lion="clion ."
alias land="goland ."

alias zshrc="code ~/.zshrc"
alias wiki="code $HOME/Documents/GitHub/wiki.seonghyeon.dev"
alias blog="code $HOME/Documents/GitHub/seonghyeon.dev"
alias dotfiles="code $HOME/Documents/GitHub/dotfiles"
alias playground="code $HOME/Documents/GitHub/playground"

alias ..="cd .."
alias ...="cd ../.."

autoload -Uz ~/.zfunc/**/*
autoload -Uz compinit && compinit
