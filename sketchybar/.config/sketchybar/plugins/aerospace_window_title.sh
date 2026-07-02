#!/bin/bash

# Get the name of the focused workspace first
name=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

# Check if any window in the focused workspace is fullscreen
is_fullscreen=$((/opt/homebrew/bin/aerospace list-windows --workspace focused --format '%{window-is-fullscreen}' | grep -q 'true' && echo "true") || echo "false")

# Fallback if no workspace is focused
if [ -z "$name" ]; then
  name="No Window"
fi

# Add an asterisk if the workspace is fullscreen
if [ "$is_fullscreen" = "true" ]; then
  name="* $name"
fi

sketchybar --set window_title label="$name"
