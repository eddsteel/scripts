#!/bin/sh
# Raise window or start app by class, using wmctrl

if [ $# -ne 2 ]; then
    echo "Usage $0 <class> <command>"
    exit 2
fi


wmctrl -a "$1" -x || $2 &
