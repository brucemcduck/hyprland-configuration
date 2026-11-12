#!/bin/bash
awk '{printf " %.1f W ", $1/1000000}' /sys/class/power_supply/BAT1/power_now
