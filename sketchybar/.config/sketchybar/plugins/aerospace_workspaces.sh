#!/bin/bash

source "$CONFIG_DIR/colors.sh"

contains_line() {
  case $'\n'"$1"$'\n' in
    *$'\n'"$2"$'\n'*) return 0 ;;
    *) return 1 ;;
  esac
}

MONITORS=$(aerospace list-monitors --format '%{monitor-id}' 2>/dev/null)
WORKSPACES=$(aerospace list-workspaces --all 2>/dev/null)
FOCUSED_MONITOR_ID=$(aerospace list-monitors --focused --format '%{monitor-id}' 2>/dev/null)

if [ -z "$MONITORS" ] || [ -z "$WORKSPACES" ]; then
  exit 0
fi

FULLSCREEN_WORKSPACES=$(
  aerospace list-windows --all --format '%{workspace} %{window-is-fullscreen}' 2>/dev/null |
    awk '$2 == "true" { print $1 }' |
    sort -u
)

args=()

for monitor_id in $MONITORS; do
  VISIBLE_ON_MONITOR=$(aerospace list-workspaces --monitor "$monitor_id" --visible 2>/dev/null)
  POPULATED_ON_MONITOR=$(aerospace list-workspaces --monitor "$monitor_id" --empty no 2>/dev/null)

  for workspace in $WORKSPACES; do
    item="aerospace_workspace.$monitor_id.$workspace"
    is_fullscreen=false

    if contains_line "$FULLSCREEN_WORKSPACES" "$workspace"; then
      is_fullscreen=true
    fi

    if contains_line "$VISIBLE_ON_MONITOR" "$workspace" && [ "$FOCUSED_MONITOR_ID" = "$monitor_id" ]; then
      args+=(--set "$item"
        drawing=on
        icon.color="$BLACK"
        label.drawing="$is_fullscreen"
        label.color="$BLACK"
        background.drawing=on
        background.color="$BLUE"
        background.border_width=0)
    elif contains_line "$VISIBLE_ON_MONITOR" "$workspace"; then
      args+=(--set "$item"
        drawing=on
        icon.color="$BLUE"
        label.drawing="$is_fullscreen"
        label.color="$BLUE"
        background.drawing=on
        background.color="$TRANSPARENT"
        background.border_color="$BLUE"
        background.border_width=2)
    elif contains_line "$POPULATED_ON_MONITOR" "$workspace"; then
      args+=(--set "$item"
        drawing=on
        icon.color="$WHITE"
        label.drawing="$is_fullscreen"
        label.color="$WHITE"
        background.drawing=on
        background.color="$BACKGROUND_2"
        background.border_width=0)
    else
      args+=(--set "$item"
        drawing=off
        label.drawing=off
        background.border_width=0)
    fi
  done
done

sketchybar "${args[@]}"
