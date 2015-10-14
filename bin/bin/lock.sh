#!/bin/bash

tmpimg='/tmp/lockscreen.png'

scrot -zq 100 "$tmpimg"
convert -resize 10% $tmpimg $tmpimg
convert -resize 1000% $tmpimg $tmpimg
i3lock --image=$tmpimg
