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
    """Display battery info from a regex matched line of acpi

    and output information that works for i3blocks blocklets. The blocklet spec
    requires the following lines to be printed:

    long output
    short output
    color

    More information can be found at
    https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet
    """
    fmt_str = "{charge}%{status}"
    charge = int(match["charge"])
    if match["status"] == "Discharging":
        status = "-"
    elif match["status"] == "Charging":
        status = "+"
    else:
        status = ""

    output = fmt_str.format(charge=charge, status=status)
    print(output)
    print(output)

    # Theme with Dracula colors - https://draculatheme.com/
    colors = (
        ["#ff5555"] * 21  # red
      + ["#ffb86c"] * 20  # orange
      + ["#f1fa8c"] * 20  # yellow
      + ["#8be9fd"] * 20  # cyan
      + ["#50fa7b"] * 20  # green
    )
    color = colors[charge]
    print(color)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-b", "--battery", type=int, default=0,
        help=("The battery number, as displayed by the 'acpi' command")
    )
    args = parser.parse_args()

    line = get_battery_line(args.battery)
    regex = r"Battery (?P<num>[0-9]+): (?P<status>[a-zA-Z]+), (?P<charge>[0-9]+)%"
    match = re.match(regex, line).groupdict()
    display_battery_info(match)
