#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          icon.color=$TEXT_COLOR \
                          label.color=$TEXT_COLOR \
                          update_freq=5 \
                          script="$PLUGIN_DIR/calendar.sh"
