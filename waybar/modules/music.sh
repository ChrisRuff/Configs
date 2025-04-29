#!/bin/bash
STATUS=$(playerctl metadata --player=Feishin --format '{{lc(status)}}')

if [[ "$STATUS" == "playing" || "$STATUS" == "paused" ]]; then
    TOOLTIP=$(playerctl metadata --player=Feishin --format '{{album}}')
    if [[ ${#TOOLTIP} -gt 40 ]]; then
        TOOLTIP=$(echo $TOOLTIP | cut -c1-35)"..."
    fi
    ARTIST=$(playerctl metadata --player=Feishin --format '{{artist}}' | cut -d\; -f1 | cut -d, -f1)
    SONG=$(playerctl metadata --player=Feishin --format '{{title}}')
    INFO=$(echo "$ARTIST - $SONG")
    # Truncate the Artist + Song if it's longer than 40 characters
    if [[ ${#INFO} -gt 40 ]]; then
        INFO=$(echo $INFO | cut -c1-40)"..."
    fi
else
    INFO="Not Playing"
fi
# check to see if song changed
if [[ -f /tmp/now_playing ]]; then
    OLD_INFO=$(cat /tmp/now_playing)
    if [[ "$INFO" != "$OLD_INFO" ]]; then
        pkill -RTMIN+5 waybar
    fi
else
    # if the file doesn't exist, then that means the script was just started
    pkill -RTMIN+5 waybar
fi
echo -e "$INFO" > /tmp/now_playing

echo -e "{\"text\":\""♫ $INFO ♫"\", \"tooltip\":\""$TOOLTIP"\"}"
