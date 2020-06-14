#!/bin/bash
CURRENT=$(i3-msg -t get_workspaces | jq -r '.[].name')

NEW="$(shuf -n1 /usr/share/dict/cracklib-small)"

WORKSPACES=$(echo "$CURRENT" | awk -v new="$NEW" 'NR==1{print new}{print $1}')

CHOSEN=$(echo "$WORKSPACES" | rofi -dmenu -i -p "Select your workspace:")
i3-msg workspace "$CHOSEN"
