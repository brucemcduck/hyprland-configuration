#!/bin/bash
MODE=$(cat /tmp/waybar-battery-mode 2>/dev/null)
if [ "$MODE" = "draw" ]; then
  exec ~/.config/waybar/power-draw.sh
fi
CAP=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo "?")
STATUS=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)
if [ "$STATUS" = "Charging" ]; then
  icons=("󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅")
else
  icons=("󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")
fi
IDX=$((CAP / 10))
[ "$IDX" -gt 10 ] && IDX=10
echo "$CAP% ${icons[$IDX]}"
