#!/bin/bash

# Create and focus a new workspace with a random name
DEST="$(shuf -n1 /usr/share/dict/cracklib-small)"

i3-msg workspace $DEST
