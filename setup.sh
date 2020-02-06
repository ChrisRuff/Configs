#!/bin/sh

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~Downloading Packages"
pacman --noconfirm -S yay

yay --noconfirm -S redshift python spotify google-chrome \
vim vifm fontforge gitkraken

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~Creating Symlinks"
ln -sfn $PWD/Vim/vimrc ~/.vimrc
ln -sfn $PWD/i3/config ~/.i3/config
ln -sfn $PWD/i3/i3_shell.sh ~/.i3/i3_shell.sh
ln -sfn $PWD/Vifm/vifmrc ~/.config/vifm/vifmrc


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~Updating Bash Profile"
cat $PWD/Bashrc_Additions/bashrc >> ~/.bashrc


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~Setting default programs"
ln -sfn $PWD/Defautls/.profile ~/.profile
ln -sfn $PWD/Defaults/mimeapps.list ~/.configs/mimeapps.list

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~Building Vim Packages"
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
