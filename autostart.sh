#!/bin/sh
/usr/bin/autokey &
/usr/bin/xcompmgr &
export PATH=/home/edd/bin:$PATH

xrdb -merge .Xresources
xmodmap .Xmodmap
(sleep 4 && /home/edd/bin/tmon) &
(sleep 4 && /home/edd/bin/tmutt) &
