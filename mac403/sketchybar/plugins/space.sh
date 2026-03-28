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

# Build label based on whether workspace has windows
if [ $window_count -gt 0 ]; then
  # Workspace has windows - show app icons
  icon_strip=""
  while read -r app; do
    icon=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
    icon_strip+=" $icon"
  done <<< "$apps"
  label="$icon_strip"
  is_empty=false
else
  # Empty workspace - show just the number
  label=""
  is_empty=true
fi

# Update colors and label based on whether this workspace is focused
if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME drawing=on \
                         background.drawing=on \
                         background.color=$ACCENT_COLOR \
                         background.padding_left=5 \
                         background.padding_right=5 \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR \
                         icon.font="SF Pro:Semibold:15.0" \
                         label.padding_right=20 \
                         label="$label"
else
  # For inactive empty workspaces, use compact width
  if [ "$is_empty" = "true" ]; then
    label_padding=0
  else
    label_padding=20
  fi

  sketchybar --set $NAME drawing=on \
                         background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR \
                         icon.font="SF Pro:Semibold:15.0" \
                         label.padding_right=$label_padding \
                         label="$label"
fi
