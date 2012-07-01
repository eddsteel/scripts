#!/bin/sh
export PATH=/home/edd/bin:$PATH
/usr/bin/autokey &
/usr/bin/xcompmgr &
/usr/bin/sparkleshare start &


xrdb -merge .Xresources
xmodmap .Xmodmap
