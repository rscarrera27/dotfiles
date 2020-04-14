eval "$(starship init zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

fpath+=~/.zfunc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.cargo/bin:$PATH:$HOME/.poetry/bin:$HOME/.toolbox"
export ZSH="$HOME/.oh-my-zsh"
export CPPFLAGS="-I$(brew --prefix zlib)/include" 
export LDFLAGS="-L$(brew --prefix zlib)/lib" 
export NVM_DIR="$HOME/.nvm"
export CFLAGS="-I$(brew --prefix openssl)/include" 
export CPPFLAGS="-I$(brew --prefix openssl)/include" 
export LDFLAGS="-L$(brew --prefix openssl)/lib"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  poetry
)

source $ZSH/oh-my-zsh.sh

alias zshrc="code ~/.zshrc"
alias cls="clear"

alias charm="pycharm ."
alias lion="clion ."
alias land="goland ."
alias please="sudo"

alias wiki="code $HOME/Documents/GitHub/wiki.seonghyeon.dev"
alias blog="code $HOME/Documents/GitHub/seonghyeon.dev"
alias dotfiles="code $HOME/Documents/GitHub/dotfiles"

function fd {
  DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux --preview "tree {} -L 3"` \
    && cd "$DIR"
}

autoload -Uz compinit && compinit
