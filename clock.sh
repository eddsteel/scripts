#!/bin/sh
XPOS=384
YPOS=127
CMD="cairo-clock -x $XPOS -y $YPOS -w 511 -g 511 -s -i -o -t zen"

PID=$(pidof cairo-clock)

if [ $PID ]; then
  killall cairo-clock
else
  $CMD
fi
