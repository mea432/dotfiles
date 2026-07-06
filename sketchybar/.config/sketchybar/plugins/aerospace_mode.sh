#!/usr/bin/env bash

CURRENT_MODE=$(aerospace list-modes --current)

case "$CURRENT_MODE" in
  main)
    sketchybar --set "$NAME" drawing=off
    ;;
  apps)
    sketchybar --set "$NAME" drawing=on icon="󰀻" label="APPS"
    ;;
  service)
    sketchybar --set "$NAME" drawing=on icon="󰒓" label="SERVICE"
    ;;
  *)
    sketchybar --set "$NAME" drawing=on icon="󰘳" label="$(printf '%s' "$CURRENT_MODE" | tr '[:lower:]' '[:upper:]')"
    ;;
esac
