#!/bin/bash
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
