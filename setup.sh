#!/bin/sh


echo "~~~~~~~~~~~~~~~Downloading Packages~~~~~~~~~~~~~~~"
pacman --noconfirm -S yay

yay --noconfirm -S redshift python spotify google-chrome \
ranger fontforge gitkraken vimb-git vim-devicons nvim \
flameshot peek

echo "~~~~~~~~~~~~~~~Creating Symlinks~~~~~~~~~~~~~~~"

ln -sfn $PWD/Vim/vimrc ~/.vimrc

mkdir -p ~/.config/nvim
ln -sfn $PWD/NVim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.i3
ln -sfn $PWD/i3/config ~/.i3/config
ln -sfn $PWD/i3/i3_shell.sh ~/.i3/i3_shell.sh

mkdir -p ~/.config/vimb
ln -sfn $PWD/Vimb/config ~/.config/vimb/config
ln -sfn $PWD/Vimb/style.css ~/.config/vimb/style.css

mkdir -p ~/.config/ranger
ln -sfn $PWD/Ranger/rc.conf ~/.config/ranger/rc.conf

mkdir -p ~/.config/redshift
ln -sfn $PWD/Redshift/redshift.conf ~/.config/redshift/redshift.conf

ln -sfn $PWD/XResources/.Xresources ~/.Xresources
ln -sfn $PWD/i3/pretty/background.png ~/Pictures/background.png

echo "~~~~~~~~~~~~~~~Updating Bash Profile~~~~~~~~~~~~~~~"
echo ". ~/.bashrc_custom" >> ~/.bashrc
ln -sfn $PWD/Bashrc_Additions/.bashrc_custom ~/.bashrc_custom
ln -sfn $PWD/Bashrc_Additions/.bash_profile ~/.bash_profile
ln -sfn $PWD/Bashrc_Additions/.bash_aliases ~/.bash_aliases

echo "~~~~~~~~~~~~~~~Setting default programs~~~~~~~~~~~~~~~"
ln -sfn $PWD/Defautls/.profile ~/.profile
ln -sfn $PWD/Defaults/mimeapps.list ~/.configs/mimeapps.list

mkdir -p ~/.local/share/applications/
ln -sfn $PWD/Defaults/mimeapps.list ~/.local/share/applications/mimeapps.list

echo "~~~~~~~~~~~~~~~Building Vim Packages~~~~~~~~~~~~~~~"
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
