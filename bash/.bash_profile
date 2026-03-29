#!/bin/bash
# Source defaults if system is Linux-based
if [ -f "/etc/skel/.bashrc" ]; then
  source  /etc/skel/.bashrc
fi
if [ -f "/etc/skel/.bash_profile" ]; then
  source  /etc/skel/.bash_profile
fi
export TERM=xterm-256color
## Terminal behavior and paths
if [ -f "$HOME/.config/dotfiles/bash/bash-powerline/bash-powerline.sh" ]; then
  source $HOME/.config/dotfiles/bash/bash-powerline/bash-powerline.sh
fi
if [ -f "/opt/homebrew/opt/chruby/share/chruby/chruby.sh" ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.4.7
fi
