#!/bin/bash

# Rename a workspace interactively through rofi
NAME=$(echo -n "" | rofi -dmenu -p "Rename workspace to:")
i3-msg rename workspace to "$NAME"
