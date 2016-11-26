#!/bin/bash

# Taken from the rofi examples on https://github.com/DaveDavenport/rofi

if [ -z $@ ]
then
function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}
# To create a new workspace, select "anonymous" and rename it afterwards
echo anonymous
gen_workspaces

else
    WORKSPACE=$@
    i3-msg workspace "${WORKSPACE}" >/dev/null
fi
