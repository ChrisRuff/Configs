#!/bin/bash

if nmcli -f GENERAL.STATE con show M85 | grep -q -E '\bactiv'; then
    nmcli con down M85
    notify-send "VPN" "Disconnected"
else
    nmcli con up M85
    notify-send "VPN" "Connected"
fi

pkill -RTMIN+7 waybar
