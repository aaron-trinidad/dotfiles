#!/bin/bash

~/.config/scripts/monitors.sh || exit 1

sleep 1

# ------------------------------
# TECLADO
# ------------------------------
setxkbmap latam

# ------------------------------
# WALLPAPER
# ------------------------------
feh --bg-scale ~/Pictures/phm_wllpper.jpg

# ------------------------------
# PICOM
# ------------------------------
killall picom 2>/dev/null
picom >/dev/null 2>&1 &

# ------------------------------
# POLYBAR
# ------------------------------
~/.config/scripts/polybar.sh
