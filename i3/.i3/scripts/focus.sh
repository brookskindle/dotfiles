#!/bin/bash

# Opens dmenu up to select the workspace you want to jump to
DEST=$(i3-msg -t get_workspaces | jq '.[] | .name' -r | trofi -dmenu -i -p "Select your workspace:")
i3-msg workspace $DEST
