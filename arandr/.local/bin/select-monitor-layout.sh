#!/bin/sh
# Simple script that uses rofi and arandr-generated scripts to switch between
# pre-configured monitor layouts.

cd ~/.screenlayout
ls | rofi -dmenu -p "Set monitor layout" | xargs sh

# Re-apply wallpaper background
sh ~/.fehbg
