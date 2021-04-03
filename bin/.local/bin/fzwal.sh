#!/bin/sh
# A simplified version of fzwal.sh that only lists user themes
#   https://github.com/Kharacternyk/fzwal

cp -f ~/.cache/wal/colors.json /tmp/fzwal-backup.json

THEME=$(ls ~/.config/wal/colorschemes/dark |
        cut -d '.' -f 1 |
        fzf --preview='wal -qet --theme {} && wal --preview')

# No theme chosen
if [ -z "$THEME" ]; then
    THEME="/tmp/fzwal-backup.json"
fi

wal -q --theme $THEME
