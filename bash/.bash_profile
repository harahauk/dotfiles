#!/bin/bash
# Source defaults if system is Linux-based
if [ -f "/etc/skel/.bashrc" ]; then
  source  /etc/skel/.bashrc
fi
if [ -f "/etc/skel/.bash_profile" ]; then
  source  /etc/skel/.bash_profile
fi

#TODO: Add any local bins like
#/Users/shad0t/Library/Python/3.9/bin

## Variables ##
export TERM=xterm-256color
#export TERM=screen-256color
export SCREENDIR=~/.screen
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

## Terminal behavior and environments ##
if [ -f "$HOME/.config/dotfiles/bash/bash-powerline/bash-powerline.sh" ]; then
  source $HOME/.config/dotfiles/bash/bash-powerline/bash-powerline.sh
fi
if [ -f "/opt/homebrew/opt/chruby/share/chruby/chruby.sh" ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.4.7
fi

# Setting PATH for Python 3.14
if [ -f "/Library/Frameworks/Python.framework/Versions/3.14/bin" ]; then
  PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"
  export PATH
fi
