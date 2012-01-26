#!/bin/sh
export PATH=/home/edd/bin:$PATH
/usr/bin/autokey &
/usr/bin/xcompmgr &

xrdb -merge .Xresources
xmodmap .Xmodmap

(sleep 4 && /home/edd/bin/tmon) &
(sleep 4 && /home/edd/bin/tmutt) &
