#!/bin/bash

tmpimg='/tmp/lockscreen.png'
scrot -zq 100 "$tmpimg"
convert -scale 10% -scale 1000% $tmpimg $tmpimg
i3lock --image=$tmpimg
rm $tmpimg
