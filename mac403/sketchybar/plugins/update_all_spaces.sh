#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Get the currently focused workspace from aerospace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Update all 10 spaces
for i in {1..10}; do
  WORKSPACE=$i
  NAME="space.$i"

  # Get app icons for this workspace
  apps=$(aerospace list-windows --workspace "$WORKSPACE" --format "%{app-name}")

  icon_strip=""
  if [ -n "$apps" ]; then
    while read -r app; do
      icon=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
      icon_strip+=" $icon"
    done <<< "$apps"
  else
    icon_strip=" —"
  fi

  # Update colors based on whether this workspace is focused
  if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.color=$ACCENT_COLOR \
                           label.color=$BAR_COLOR \
                           icon.color=$BAR_COLOR \
                           label="$icon_strip"
  else
    sketchybar --set $NAME background.drawing=off \
                           label.color=$ACCENT_COLOR \
                           icon.color=$ACCENT_COLOR \
                           label="$icon_strip"
  fi
done
