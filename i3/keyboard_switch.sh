#!/bin/bash
DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo ${DIR}

if setxkbmap -query | grep -q "variant:\s\+colemak_dh" 
then
	setxkbmap -layout us
	\cp ${DIR}/config_reg ${DIR}/config
	\cp ${DIR}/../NVim/reg.vim ${DIR}/../Nvim/init.vim
else
	setxkbmap -layout us -variant colemak_dh
	\cp ${DIR}/config_colemak ${DIR}/config
	\cp ${DIR}/../NVim/col.vim ${DIR}/../Nvim/init.vim
fi 
i3-msg reload
