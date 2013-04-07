#!/bin/sh
export PATH=/home/edd/bin:$PATH
/usr/bin/xcompmgr &
/usr/bin/sparkleshare start &
/usr/bin/redshift &

if [ -f ~/.fehbg ]; then . ~/.fehbg; fi
if [ -f ~/.screenlayout/normal.sh ]; then $(~/.screenlayout/normal.sh); fi

xset -b
xrdb -merge .Xresources
xmodmap .Xmodmap
