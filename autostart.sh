#!/bin/sh
export PATH=/home/edd/bin:$PATH
/usr/bin/autokey &
/usr/bin/xcompmgr &
/usr/bin/sparkleshare start &

if [ -f ~/.fehbg ]; then source ~/.fehbg; fi

xset -b
xrdb -merge .Xresources
xmodmap .Xmodmap
