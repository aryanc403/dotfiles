#!/bin/sh

source "$CONFIG_DIR/colors.sh"

# Extract workspace ID from space name (e.g., "space.1" -> "1")
WORKSPACE=${NAME##*.}

# Get the currently focused workspace from aerospace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Get app icons for this workspace
apps=$(aerospace list-windows --workspace "$WORKSPACE" --format "%{app-name}")

# Count windows in this workspace
window_count=$(echo "$apps" | grep -c .)

# If workspace is empty and not focused, hide it completely
if [ $window_count -eq 0 ] && [ "$WORKSPACE" != "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Workspace has windows or is focused, so show it
icon_strip=""
if [ -n "$apps" ]; then
  while read -r app; do
    icon=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
    icon_strip+=" $icon"
  done <<< "$apps"
else
  icon_strip=" —"
fi

# Update label with app icons and set colors based on whether this workspace is focused
if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME drawing=on \
                         background.drawing=on \
                         background.color=$ACCENT_COLOR \
                         background.padding_left=5 \
                         background.padding_right=5 \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR \
                         label="$icon_strip"
else
  sketchybar --set $NAME drawing=on \
                         background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR \
                         label="$icon_strip"
fi
