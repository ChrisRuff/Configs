#!/bin/bash
CURRENT=$(hyprctl getoption misc:enable_swallow | grep -c "int: 1")
if [ "$CURRENT" == "1" ]; then
  hyprctl keyword misc:enable_swallow false
else
  hyprctl keyword misc:enable_swallow true
fi
