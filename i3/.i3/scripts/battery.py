#!/usr/bin/env python3

# Scrapes the command from 'acpi' to determine the battery life of a given
# battery.

import argparse
import re
import subprocess
import colour


def get_battery_line(battery_num):
    """Return acpi info for a given battery number"""
    p = subprocess.Popen("acpi -b".split(), stdout=subprocess.PIPE)
    stdout, _ = p.communicate()
    stdout = stdout.decode("utf-8")
    batteries = stdout.splitlines()
    battery = batteries[battery_num]
    return battery


def display_battery_info(match):
    """Display battery info from a regex matched line of acpi"""
    fmt_str = "{charge}%{status}"
    charge = int(match["charge"])
    if match["status"] == "Discharging":
        status = "-"
    elif match["status"] == "Charging":
        status = "+"
    else:
        status = ""

    output = fmt_str.format(charge=charge, status=status)
    # Perhaps because of the i3bar spec, we need to output it twice if we want
    # to have color added.
    print(output)
    print(output)
    # What color should we output this status as?
    green = colour.Color("green")
    red = colour.Color("red")
    colors = list(red.range_to(green, steps=101))
    color = colors[charge].get_hex()
    print(color)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-b", "--battery", type=int, default=0,
        help=("The battery number, as displayed by the 'acpi' command")
    )
    args = parser.parse_args()

    line = get_battery_line(args.battery)
    # TODO: get life remaining for battery
    regex = r"Battery (?P<num>[0-9]+): (?P<status>[a-zA-Z]+), (?P<charge>[0-9]+)%"
    match = re.match(regex, line).groupdict()
    display_battery_info(match)
