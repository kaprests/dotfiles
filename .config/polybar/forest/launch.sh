#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/forest"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#  polybar --reload example &
#fi

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar --reload example &
#done

if type "xrandr">/dev/null; then
  echo "Lanching polybar for each screen"
  xrandr --listactivemonitors | grep -oP '(HDMI\-\d+$|eDP\-\d+$)' | xargs -P1 -I{} bash -c "MONITOR={} polybar -q -r p00 &"
fi

## Launch the bar
#polybar -q main -c "$DIR"/config.ini &
