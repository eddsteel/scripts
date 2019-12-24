#!/bin/sh

qry="$1"
cmd="$qry"

swaymsg "[class=\"(?i)$qry\"] focus" > /dev/null 2>&1 || $cmd
