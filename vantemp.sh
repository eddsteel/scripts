#!/usr/bin/env bash
#
# Gets YVR's latest temperature
#
#

curl http://weather.noaa.gov/weather/current/CYVR.html 2>/dev/null | grep Temperature -A2 -m1 | tail -n 1 | sed -e 's/.*(\(.*\)).*/\1/' -e 's/ /°/' | tr -d '[:space:]'
