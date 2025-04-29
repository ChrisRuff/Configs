#!/bin/bash
if $(hyprctl devices | grep -q "colemak_dh"); 
then 
    echo -e "{\"text\":\"col\"}"
else
    echo -e "{\"text\":\"qwe\"}"
fi
