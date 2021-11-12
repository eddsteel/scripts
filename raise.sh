#!/bin/sh
# Raise window or start app, using wmctrl

if [ $# -ne 2 ]; then
    echo "Usage $0 <name> <command>"
    exit 2
fi


wmctrl -a "$1" || $2 &
