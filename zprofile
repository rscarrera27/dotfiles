[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

path=(
  $path
  $PYENV_ROOT/bin
)

[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
