#!/bin/bash

sketchybar --add item volume right \
           --set volume icon.color=$TEXT_COLOR \
                        label.color=$TEXT_COLOR \
                        script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change \
