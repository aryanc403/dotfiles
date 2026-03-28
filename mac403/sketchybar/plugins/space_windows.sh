#!/bin/bash

# $1 is the workspace ID passed from the sketchybarrc loop (e.g., 1, 2, 3)
WORKSPACE=$1

# 1. Get all app names on this specific workspace
apps=$(aerospace list-windows --workspace "$WORKSPACE" --format "%{app-name}")

icon_strip=""
if [ -n "$apps" ]; then
  while read -r app; do
    # Call your icon map function
    icon=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
    icon_strip+=" $icon"
  done <<< "$apps"
else
  icon_strip=" —"
fi

# 2. Highlight the current workspace
if [ "$WORKSPACE" = "$AEROSPACE_FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" label="$icon_strip" icon.highlight=on label.highlight=on
else
  sketchybar --set "$NAME" label="$icon_strip" icon.highlight=off label.highlight=off
fi
