#!/usr/bin/env bash

# Determine latitude and longitude from IP address
lat_lon=$(curl ipinfo.io -s | jq .loc | tr -d '"')  # Eg: 26.33,-173.000
lat=$(echo $lat_lon | cut -f1 -d,)  # Eg: 26.33
lon=$(echo $lat_lon | cut -f2 -d,)  # Eg: -173.000

# Use openweathermap to find current weather information based on physical
# location.
source ~/.openweathermaprc  # Should give us API_KEY. If not, create the file.
URL="api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&APPID=$API_KEY"
DATA=$(curl -s $URL)
if [ "$?" -ne "0" ]; then return -1; fi

WEATHER=$(echo $DATA | jq -r '.weather[0].main')
TEMP=$(echo $DATA | jq -r '.main.temp')
TEMP=${TEMP%.*}
NIGHT=$(echo $WEATHER | cut -d " " -f1)
shopt -s nocasematch
case $WEATHER in
    *fog* | *mist*) echo -ne '\uf070';;
    *storm*) echo -ne '☇';;  # lightning
    *rain* | *drizzle*) echo -ne '☂';;  # umbrella
    *cloud*) echo -ne '☁';;  # cloud
    *snow*) echo -ne '☃';;  # snowman
    *sun* | *clear*)
        if [ "$NIGHT" == "night" ]; then
            echo -ne '☾'  # moon
        else
            echo -ne '☼'  # sun
        fi;;
esac
echo -n " $WEATHER, $(($TEMP-273))°C"
