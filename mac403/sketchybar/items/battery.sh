#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=60 \
                         icon.color=$TEXT_COLOR \
                         label.color=$TEXT_COLOR \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change
