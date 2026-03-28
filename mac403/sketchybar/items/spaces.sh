#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add item space.$sid left \
             --set space.$sid icon=$sid \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=20 \
                              label.y_offset=-1 \
                              update_freq=1 \
                              script="$PLUGIN_DIR/space.sh" \
                              click_script="aerospace workspace $sid" \
                              background.corner_radius=5 \
                              background.height=25
done

# You can keep the separator
sketchybar --add item space_separator left \
           --set space_separator icon="􀆊" \
                                 icon.color=$ACCENT_COLOR
