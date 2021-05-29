export PYENV_ROOT="$HOME/.pyenv"

path=(
  $path
  $PYENV_ROOT/bin
)

eval "$(pyenv init --path)"

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


