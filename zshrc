[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"
export SDKMAN_DIR="$HOME/.sdkman"

fpath=(
  $fpath
  $HOME/.zfunc
)

path=(
  $path
  /usr/local/sbin
  $HOME/.toolbox
  $HOME
  /usr/local/bin
  /usr/local/opt
)

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
  fasd
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsecrets
source $HOME/.zalias
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh

autoload -Uz ~/.zfunc/**/*
autoload -Uz compinit && compinit
