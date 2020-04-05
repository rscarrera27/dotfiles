eval "$(starship init zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

fpath+=~/.zfunc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.cargo/bin:$PATH:$HOME/.poetry/bin:$HOME/.toolbox"
export ZSH="$HOME/.oh-my-zsh"
export CPPFLAGS="-I$(brew --prefix zlib)/include" 
export LDFLAGS="-L$(brew --prefix zlib)/lib" 

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias zshrc="code ~/.zshrc"

alias charm="pycharm ."
alias lion="clion ."
alias land="goland ."

alias wiki="code $HOME/Documents/GitHub/wiki.seonghyeon.dev"
alias blog="code $HOME/Documents/GitHub/seonghyeon.dev"

autoload -Uz compinit && compinit
