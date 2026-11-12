#!/bin/bash
STATUS=$(cat /sys/class/power_supply/BAT1/status)
[ "$STATUS" != "Discharging" ] && { notify-send -u low "Battery ETA" "On AC power"; exit; }

ENERGY=$(cat /sys/class/power_supply/BAT1/energy_now)
POWER=$(cat /sys/class/power_supply/BAT1/power_now)
CAP=$(cat /sys/class/power_supply/BAT1/capacity)
[ "$POWER" -le 0 ] && { notify-send -u low "Battery ETA" "Power data unavailable"; exit; }

HRS=$(awk "BEGIN {printf \"%.1f\", $ENERGY/$POWER}")
H=$(echo "$HRS" | cut -d. -f1)
M=$(awk "BEGIN {printf \"%d\", ($HRS - $H) * 60}")

notify-send -u low "Battery ETA" "${H}h ${M}m remaining — ${CAP}% ($HRS h)"
