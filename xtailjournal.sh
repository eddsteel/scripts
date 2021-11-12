#!/bin/sh
FONT="xft:Droid Sans Mono:size=8:style=Regular"
wmctrl -s 3
xterm -ah -uc -fa "$FONT" -fullscreen -vb -fg "#666666" -bg "#222222" -e env -i journalctl -xef &
sleep 1
wmctrl -s 0


