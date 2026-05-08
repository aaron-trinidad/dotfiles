#!/bin/bash

STEP="$1"
MIN=10

# Obtener brillo actual
current=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

if [[ "$STEP" == *"-"* ]]; then
  new=$((current - 10))
  if [ "$new" -lt "$MIN" ]; then
    brightnessctl set ${MIN}%
    notify-send -r 9992 "💡 Brillo ${MIN}%" -h int:value:${MIN}
    exit 0
  fi
fi

# Aplicar cambio
brightnessctl set "$STEP"

# Obtener nuevo valor
value=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

notify-send -r 9992 "💡 Brillo ${value}%" -h int:value:${value}
