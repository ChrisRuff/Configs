#!/bin/bash
swayidle -w \
    timeout 1800 'hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on'
    timeout 3600 'hyprctl dispatch dpms on && systemctl suspend' \
    #resume 'hyprctl dispatch dpms on'
