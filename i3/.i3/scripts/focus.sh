#!/bin/bash

# Use rofi to select either a workspace or window to focus
rofi -combi-modi workspace:$HOME/.i3/scripts/i3_switch_workspaces.sh,window -show combi -switchers combi
