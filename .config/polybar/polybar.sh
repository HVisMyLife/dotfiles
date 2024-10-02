#!/usr/bin/env sh

sleep 3s

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      MONITOR=$m polybar -c ~/.config/polybar/config.ini &
  done
else
  polybar -c ~/.config/polybar/config.ini &
fi
