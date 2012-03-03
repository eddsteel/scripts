#!/bin/sh
export PATH=/home/edd/bin:$PATH
/usr/bin/autokey &
/usr/bin/xcompmgr &
/usr/bin/sparkleshare start &


xrdb -merge .Xresources
xmodmap .Xmodmap

(sleep 10 && /home/edd/bin/tmon) &
(sleep 10 && /home/edd/bin/tmutt) &
