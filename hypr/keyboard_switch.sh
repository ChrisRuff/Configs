#!/usr/bin/env sh
KEYBOARDLAYOUT=$(hyprctl getoption input:kb_variant | awk 'NR==1{print $2}')
if [ "$KEYBOARDLAYOUT" = "colemak_dh" ] ; then
    hyprctl --batch "keyword input:kb_variant ,qwerty"
else
    hyprctl reload
fi

pkill -RTMIN+6 waybar
