#! /bin/sh

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$CAPACITY" -lt 10 ] && [ "$STATUS" = "Discharging" ]; then
    [ "$CAPACITY" -lt 5 ] && URGENCY="error" || URGENCY="warning"
    i3-nagbar -t $URGENCY -m "WARNING, low battery: $CAPACITY%"
fi
