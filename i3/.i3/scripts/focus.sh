#!/bin/bash

# Opens dmenu up to select the workspace you want to jump to
DEST=$(i3-msg -t get_workspaces | python -c 'import sys,json; inp=sys.stdin.read().strip();jinp = json.loads(inp); print "\n".join([e["name"] for e in jinp])' | rofi -dmenu -p "Select your workspace:")
i3-msg workspace $DEST
