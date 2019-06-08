#!/usr/bin/env python3
"""
This i3blocks blocklet scrapes One Bus Away to get realtime bus departure
information for a given bus stop (and optionally for a given bus route at that
stop). The information is then printed to stdout in the i3status format (shown
below).
    Line 1: full text
    Line 2: (optional) short text
"""

import argparse
import configparser
import os
from typing import List, NamedTuple
from urllib.parse import urlencode

from bs4 import BeautifulSoup
import requests


Arrival = NamedTuple("Arrival", [("route", str), ("minutes_away", int)])


def arrivals_at_stop(stop_id: str, *, route: str="all") -> List[Arrival]:
    """Return bus arrivals for a given bus stop. Can optionally filter by route

    Example:
    http://pugetsound.onebusaway.org/where/standard/stop.action?id=1_623&route=40_100479

    Arguments:
        stop_id: the bus stop id, as identified by the `id` parameter in the
                 above url.
        route: the bus route to filter on, as identified by the `route`
               parameter in the above url. If not given, all bus routes will be
               shown.
    """
    base_url = "http://pugetsound.onebusaway.org/where/standard/stop.action"
    params = urlencode({"id": stop_id, "route": route})
    url = f"{base_url}?{params}"

    arrivals = []
    response = requests.get(url)
    if response.status_code == 200:
        html = BeautifulSoup(response.text, "html.parser")
        table = html.find("table", {"class": "arrivalsTable"})
        routes = table.findAll("td", {"class": "arrivalsRouteEntry"})
        times = table.findAll("td", {"class": "arrivalsStatusEntry"})
        for route, time in zip(routes, times):
            arrival = Arrival(
                route=route.a.contents[0],
                # Arrival time can be either be "NOW" or alphanumeric ("-2",
                # "3", "15", etc...). Convert to it to an integer in any case.
                minutes_away=int(time.a.span.contents[0].replace("NOW", "0")),
            )
            arrivals.append(arrival)

    return arrivals


def display(arrivals: List[Arrival]):
    """Display the bus arrivals in i3status format"""
    if not arrivals:
        return  # No arrivals to display

    verbose_arrivals = "".join(
        [f"{arrival.minutes_away}m --> " for arrival in arrivals]
    )[:-5]
    short_arrivals = arrivals[0].minutes_away
    print(verbose_arrivals)
    print(short_arrivals)


def load_config() -> configparser.ConfigParser:
    """Load and return the onebusaway section config for stop id and route"""
    config = configparser.ConfigParser()
    config.read(os.path.expanduser("~/.onebusawayrc"))
    return config["onebusaway"]


def main():
    config = load_config()
    stop_id = config["stop_id"]
    route = config.get("route", "all")

    arrivals = arrivals_at_stop(stop_id, route=route)
    display(arrivals)


if __name__ == "__main__":
    main()
