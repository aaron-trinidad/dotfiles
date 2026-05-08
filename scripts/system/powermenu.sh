#!/bin/bash

options=" \tLock\n󰒲 \tSuspend\n \tReboot\n \tShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power")

case "$chosen" in
*Lock) i3lock -c 1a1b26 ;;
*Suspend) i3lock -c 1a1b26 && systemctl suspend ;;
*Reboot) systemctl reboot ;;
*Shutdown) systemctl poweroff ;;
esac
