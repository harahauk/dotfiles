#/bin/env sh
DIR=(`pwd`)
echo Configuring homedir with dotfiles from $DIR
echo Fetching submodules..
git submodule init
git submodule update
cd
echo Configuring vim..
ln -s $DIR/.vim
ln -s $DIR/.vimrc
echo Configuring i3
mv .config/i3 .config/i3.backup
ln -s $DIR/i3 .config/i3
echo Settings for GNU Screen
ln -s $DIR/.screenrc .screenrc
echo Symlinking .XResources
ln -s $DIR/.Xresources .Xresources
echo Sourcing powerline to bash
echo source $DIR/bash/bash-powerline/bash-powerline.sh >> .bashrc
# Since i don't bother with a bashrc for most systems now
echo export TERM=xterm-256color >> ~/.bashrc
echo Done.

