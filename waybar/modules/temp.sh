#!/bin/bash
source ~/.config/waybar/modules/.env
function get_temps()
{
    CURRENT_TEMP=$(curl -H "Authorization: Bearer $HA_TOKEN" -H "Content-Type: application/json" $HA_URL/api/states/sensor.home_realfeel_temperature | jq -r '.state')
    MIN_TEMP=$(curl -H "Authorization: Bearer $HA_TOKEN" -H "Content-Type: application/json" $HA_URL/api/states/sensor.home_realfeel_temperature_min_today | jq -r '.state')
    MAX_TEMP=$(curl -H "Authorization: Bearer $HA_TOKEN" -H "Content-Type: application/json" $HA_URL/api/states/sensor.home_realfeel_temperature_max_today | jq -r '.state')

    CURRENT_TEMP_F=$(awk -v c="$CURRENT_TEMP" 'BEGIN {printf("%.2f", 1.8 * c + 32)}')
    MIN_TEMP_F=$(awk -v c="$MIN_TEMP" 'BEGIN {printf("%.2f", 1.8 * c + 32)}')
    MAX_TEMP_F=$(awk -v c="$MAX_TEMP" 'BEGIN {printf("%.2f", 1.8 * c + 32)}')

    echo -e "{\"text\":\""$MIN_TEMP°C ≤ $CURRENT_TEMP°C ≤ $MAX_TEMP°C"\", \"tooltip\":\""$MIN_TEMP_F°F ≤ $CURRENT_TEMP_F°F ≤ $MAX_TEMP_F°F"\"}"
}

function get_icon()
{
    CONDITION=$(curl -H "Authorization: Bearer $HA_TOKEN" -H "Content-Type: application/json" $HA_URL/api/states/sensor.home_condition_today | jq -r '.state')
    

    case $(echo $CONDITION | tr '[:upper:]' '[:lower:]') in
        *hot* | *sunny*)
            CONDITION_ICON="☀️"
            ;;
        *partly\ cloudy*)
            CONDITION_ICON="🌤️"
            ;;
        *cloudy*)
            CONDITION_ICON="☁️"
            ;;
        *rain*)
            CONDITION_ICON="🌧️"
            ;;
        *thunderstorm*)
            CONDITION_ICON="⛈️"
            ;;
        *snow*)
            CONDITION_ICON="❄️"
            ;;
        *fog*)
            CONDITION_ICON="🌫️"
            ;;
        *wind*)
            CONDITION_ICON="💨"
            ;;
        *cold*)
            CONDITION_ICON="❄️"
            ;;
        *clear*)
            CONDITION_ICON="🌙"
            ;;
        *)
            CONDITION_ICON="❓"
            ;;
    esac
    CONDITION_SHORT=$(echo $CONDITION | cut -c1-35)"..."
    echo -e "{\"text\":\""$CONDITION_ICON"\", \"tooltip\":\""$CONDITION_SHORT"\"}"
}
