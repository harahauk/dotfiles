#/bin/bash

##
# Quick onboarding for new clients
# - Symlinks (ln -s) configuration-files to the ones defines in this repo
# - Backups any configuration in place that does not seem to origin from this script
##
#TODO: .zshrc, Joplin

## Repository ##
DIR=(`pwd`)
echo "Dotfiles will be sourced from '$DIR'"
echo "Git - Fetching submodules in the 'dotfiles'-repo.."
git submodule init
git submodule update --remote

## Applications ##
cd
#TODO: Write a function to reuse the tests
echo Configuring Vim..
if [ -L .vim ]; then
  echo "'.vim' was already symlinked, skipping Vim"
else
  ln -s $DIR/.vim $HOME/.vim
  ln -s $DIR/.vimrc $HOME/.vimrc
  echo "Symlinked '.vim' and '.vimrc'. Use ':BundleInstall!' in the editor if still using 'Vundle'."
fi
echo "Configuring 'i3'.."
if [ -e "$HOME/i3" ]; then
  echo "Old 'i3'-config found directly in home-directory, will be moved to '.config/i3.backup_`date -I`"
  mv $HOME/i3 $HOME/.config/i3.backup_`date -I`
fi
if [ -e "$HOME/.config/i3" ]; then
  if [ -e "$HOME/.config/i3" ]; then
    if [ -L "$HOME/.config/i3" ]; then
      echo "'$HOME/.config/i3' already symlinked, skipping."
    else
      echo "Existing 'i3'-config moved to '.config/i3/backup_`date -I`'"
      mv $HOME/.config/i3 $HOME/.config/i3.backup_`date -I`
      ln -s $DIR/i3 $HOME/.config/i3
      echo "Symlinked 'i3'-configuration."
    fi
  fi
else
  ln -s $DIR/i3 $HOME/.config/i3
  echo "Symlinked 'i3'-configuration."
fi
echo "Settings for 'GNU Screen'.."
if [ -f "$HOME/.screenrc" ]; then
  if [ -L "$HOME/.screenrc" ]; then
    echo "'.screenrc' already symlinked. Skipping.."
  else
    echo "Existing '.screenrc' will be moved to $HOME/.config/.screenrc_backup_`date -I`"
    mv $HOME/.screenrc $HOME/.config/.screenrc_backup_`date -I`
    ln -s $DIR/.screenrc $HOME/.screenrc
    echo "'GNU Screen' configured."
  fi
else
  ln -s $DIR/.screenrc $HOME/.screenrc
  echo "'.screenrc' now symlinked."
fi
if [ -e "/Users/" ]; then
  echo "Skipping '.XResources' as system is likely 'Mac OS' or 'MS Windows' (/Users exist)"
else
  echo "Symlinking '.XResources'"
  ln -s $DIR/.Xresources $HOME/.Xresources
fi
## Bash ##
if [ -L "$HOME/.bashrc" ]; then
  echo "'.bashrc' already symlinked. Skipping."
else
  if [ -f "$HOME/.bashrc" ]; then
    echo "Existing '.bashrc' will be moved to '.config/.bashrc_backup_`date -I`"
    mv $HOME/.bashrc $HOME/.config/.bashrc_backup_`date -I`
    ln -s $DIR/bash/.bashrc $HOME/.bashrc
    echo "'.bashrc' now symlinked."
  else
    ln -s $DIR/bash/.bashrc $HOME/.bashrc
    echo "'.bashrc' now symlinked."
  fi
fi
if [ -L "$HOME/.bash_profile" ]; then
  echo "'.bash_profile' already symlinked. Skipping."
else
  if [ -f ".bash_profile" ]; then
    echo "Existing '.bash_profile' will be moved to '.config/.bash_profile_`date -I`"
    mv $HOME/.bash_profile $HOME/.config/.bashrc_profile_`date -I`
    ln -s $DIR/bash/.bash_profile $HOME/.bash_profile
    echo "'.bash_profile' symlinked."
  else
    ln -s $DIR/bash/.bash_profile $HOME/.bash_profile
    echo "'.bash_profile' symlinked."
  fi
fi
# All done
echo "'deploy.sh' Done."
