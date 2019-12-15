#!/bin/bash
echo "Creating Symlinks"
ln -sfn $PWD/Vim/vimrc /etc/vimrc
ln -sfn $PWD/i3/config ~/.i3/config
ln -sfn $PWD/i3/i3_shell.sh ~/.i3/i3_shell.sh
ln -sfn $PWD/Vifm/vifmrc ~/.config/vifm/vifmrc


echo "Updating Bash Profile"
cat $PWD/Bashrc_Additions/bashrc >> ~/.bashrc
