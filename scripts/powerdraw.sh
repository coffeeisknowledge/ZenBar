#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT0"
ICON="󰠰"

if [[ -f "$BAT_PATH/current_now" && -f "$BAT_PATH/voltage_now" ]]; then
  current=$(cat "$BAT_PATH/current_now") # en microamperios (uA)
  voltage=$(cat "$BAT_PATH/voltage_now") # en microvoltios (uV)

  # Convertir a vatios: (uA * uV = picoWatts) → dividir entre 1_000_000_000 para obtener W
  power=$(echo "scale=2; ($current * $voltage) / 1000000000000" | bc)

  echo "{\"text\":\"$ICON ${power}w\", \"tooltip\":\"Power Draw $ICON ${power}w\"}"
else
  echo "{\"text\":\"$ICON N/A\", \"tooltip\":\"Power Draw $ICON N/A\"}"
fi
