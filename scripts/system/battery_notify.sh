#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT0"
LOW=20
CRITICAL=10

STATE_FILE="/tmp/battery_warning_state"

capacity=$(cat "$BAT_PATH/capacity")
status=$(cat "$BAT_PATH/status")

prev_state=$(cat "$STATE_FILE" 2>/dev/null)

if [ "$status" = "Discharging" ]; then

  if [ "$capacity" -le "$CRITICAL" ] && [ "$prev_state" != "critical" ]; then
    notify-send "⚠️ Batería crítica" "$capacity%" -u critical
    echo "critical" >"$STATE_FILE"

  elif [ "$capacity" -le "$LOW" ] && [ "$prev_state" != "low" ]; then
    notify-send "🔋 Batería baja" "$capacity%" -u normal
    echo "low" >"$STATE_FILE"

  elif [ "$capacity" -gt "$LOW" ]; then
    echo "normal" >"$STATE_FILE"
  fi

else
  echo "charging" >"$STATE_FILE"
fi
