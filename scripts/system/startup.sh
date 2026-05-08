#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

# ------------------------------
# MONITORES
# ------------------------------
if xrandr | grep "$EXTERNAL connected"; then
  xrandr \
    --output $INTERNAL --primary --mode 1280x720 \
    --output $EXTERNAL --right-of $INTERNAL --scale 1x1
else
  xrandr \
    --output $INTERNAL --primary --mode 1280x720 \
    --output $EXTERNAL --off
fi

sleep 1

# ------------------------------
# TECLADO
# ------------------------------
setxkbmap latam

# ------------------------------
# WALLPAPER
# ------------------------------
feh --bg-scale ~/Pictures/wallpaper.jpg

# ------------------------------
# POLYBAR
# ------------------------------
killall polybar
sleep 1

polybar main-internal &

if xrandr | grep "$EXTERNAL connected"; then
  polybar main-external &
fi

# ------------------------------
# PICOM
# ------------------------------
killall picom
picom &
