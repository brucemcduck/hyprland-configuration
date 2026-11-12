#!/bin/bash
while true; do
  inotifywait -q -e close_write -e moved_to -e move -e create ~/.config/waybar
  killall -SIGUSR2 waybar
  sleep 0.2
done
