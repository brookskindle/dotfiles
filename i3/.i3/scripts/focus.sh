#!/bin/bash
WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[].name' | rofi -dmenu -i -p "Select your workspace")
i3-msg workspace "$WORKSPACE"
