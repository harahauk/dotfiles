export TERM=xterm-256color
if [ -f "$HOME/.config/dotfiles/bash/bash-powerline/bash-powerline.sh" ]; then
  source $HOME/.config/dotfiles/bash/bash-powerline/bash-powerline.sh
fi
if [ -f "/opt/homebrew/opt/chruby/share/chruby/chruby.sh" ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.4.7
fi
