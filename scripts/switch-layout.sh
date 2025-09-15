#!/bin/bash
# Cambia layout del teclado "principal" (main:true)

main_kb=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .name')
hyprctl switchxkblayout "$main_kb" next
