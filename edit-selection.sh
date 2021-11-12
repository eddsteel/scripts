#!/bin/sh

TMP=$(mktemp)
/usr/bin/xclip -o >$TMP
$EDITOR $TMP
cat $TMP | xclip -i
/usr/bin/xdotool key ctrl+v
rm $TMP
