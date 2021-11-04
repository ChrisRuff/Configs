#!/bin/bash
DIR="$( readlink -f `which $0`)"
DIR="$(dirname "$DIR")"
DIR="$(dirname "$DIR")"

cat ${DIR}/i3/common > ${DIR}/i3/config
if setxkbmap -query | grep -q "variant:\s\+colemak_dh" 
then
	setxkbmap -layout us
	cat ${DIR}/i3/config_reg >> ${DIR}/i3/config
	\cp ${DIR}/NVim/reg.vim ${DIR}/NVim/init.vim
else
	setxkbmap -layout us -variant colemak_dh
	cat ${DIR}/i3/config_colemak >> ${DIR}/i3/config
	\cp ${DIR}/NVim/col.vim ${DIR}/NVim/init.vim
fi 
i3-msg reload
setxkbmap -option lv3:rwin_switch
xmodmap ~/.Xmodmap
