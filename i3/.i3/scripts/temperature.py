#!/usr/bin/env python3

# Scrapes 'acpi -t' to display thermal temperatures for a status bar. Includes
# colorized output

import subprocess
import colour

def temperature():
    """Returns the computer temperature in Celsius."""
    p = subprocess.Popen("acpi -t".split(), stdout=subprocess.PIPE)
    # Stdout should be something like the following:
    #   Thermal 0: ok, 46.0 degrees C
    stdout, _ = p.communicate()
    stdout = stdout.decode("utf-8")
    # From what I can tell, temperature is always a whole number (ie, 47.0).
    # Might as well convert it to an integer.
    temp = int(float(stdout.split()[-3]))
    return temp

if __name__ == "__main__":
    temp = temperature()
    output = "{}°C".format(temp)

    print(output)
    print(output)

    # What color should the output be?
    blue = colour.Color("blue")
    red = colour.Color("red")
    # Trip point is 128 degrees celsius
    colors = list(blue.range_to(red, steps=129))
    color = colors[temp].get_hex()
    print(color)
