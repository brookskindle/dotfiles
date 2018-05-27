#!/bin/bash

# Rename a workspace interactively through rofi
NAME=$(echo "" | trofi -dmenu -i -p "Rename workspace to:")
i3-msg "rename workspace to \"$NAME\""
