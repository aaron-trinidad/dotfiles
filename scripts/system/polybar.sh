#!/bin/bash

killall polybar

while pgrep -x polybar >/dev/null; do
  sleep 0.2
done

if xrandr | grep -q "^eDP-1 connected"; then
  MONITOR=eDP-1 polybar main-internal &
fi

if xrandr | grep -q "^HDMI-1 connected"; then
  MONITOR=HDMI-1 polybar main-external &
fi
