#!/bin/bash
current_sink=$(pactl get-default-sink) 
sink_0=$(pactl list short sinks | grep HyperX | cut -f2) 
sink_1=$(pactl list short sinks | grep -E -i '(alsa_output.pci).*(analog-stereo)' | cut -f2) 

if [ "$current_sink" = "$sink_0" ]; then
    echo "Switching to sink 1: $sink_1"
    pactl set-default-sink "$sink_1"
else
    echo "Switching to sink 0: $sink_0"
    pactl set-default-sink "$sink_0"
fi
