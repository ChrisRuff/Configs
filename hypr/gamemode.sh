#!/bin/bash
if [[ $XDG_SESSION_TYPE == "x11" ]]; then
    echo "Running $@ with gamemoderun"
    "$@"
elif [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    #MANGOHUD=1 gamemoderun "$@"
    #gamescope --expose-wayland --backend wayland -h 720 -H 1080 -r 60 -F fsr -e -f --force-grab-cursor -- "$@"
    echo "Running $@ with gamescope"
    MANGOHUD=1 gamescope --backend wayland -h 1080 -H 1080 -r 60 -F fsr -feb --force-composition --force-grab-cursor -- env VKD3D_DISABLE_EXTENSIONS=VK_KHR_present_wait "$@"
fi
