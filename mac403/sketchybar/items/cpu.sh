#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      icon.color=$TEXT_COLOR \
                      label.color=$TEXT_COLOR \
                      script="$PLUGIN_DIR/cpu.sh"
