#!/bin/bash
f=/tmp/waybar-battery-mode
if [ "$(cat $f 2>/dev/null)" = "draw" ]; then
  echo cap > "$f"
else
  echo draw > "$f"
fi
pkill -RTMIN+8 waybar
