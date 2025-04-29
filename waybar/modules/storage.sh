#!/bin/bash

# Get the percentage of free space on the root (/) partition
percent=$((100 - $(df --output=pcent $1 | tail -n 1 | tr -dc '0-9')))
total=$(df --output=size -h $1 | tail -n 1 | tr -d '[:space:]')
used=$(df --output=used -h $1 | tail -n 1 | tr -d '[:space:]')

bars=("█" "▇" "▆" "▅" "▄" "▃" "▂" "▁")
bar_index=$((percent * ${#bars[@]} / 100))
bar=${bars[$bar_index]}

percent=$((100 - $percent))
if [ $percent -gt 95 ]; then
    color_class="critical"
elif [ $percent -gt 90 ]; then
    color_class="high"
elif [ $percent -gt 75 ]; then
    color_class="elevated"
elif [ $percent -gt 50 ]; then
    color_class="normal"
elif [ $percent -gt 25 ]; then
    color_class="low"
else
    color_class="minimal"
fi
color=${color[$color_index]}

echo -e '{"text": "'$bar' ", "class": "'$color_class'", "tooltip": "'$1': '$used'/'$total' ('$percent'%)"}'
