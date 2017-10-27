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
echo Sourcing powerline to bash
echo source $DIR/bash/bash-powerline/bash-powerline.sh >> .bashrc
# Since i don't bother with a bashrc for most systems now
echo export TERM=xterm-256color >> ~/.bashrc
echo Done.

