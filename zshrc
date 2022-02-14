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

eval "fortune ~/fortunes"

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


