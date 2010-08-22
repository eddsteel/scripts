#!/bin/sh

xmodmap ~/.Xmodmap
xmodmap -e "keycode 108 = Pointer_Button3"
xmodmap -e "keycode 116 = Pointer_Button2"
xkbset m
syndaemon -d -t -i 2
