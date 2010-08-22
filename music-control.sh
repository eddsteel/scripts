#!/bin/bash

PLAYER="/usr/bin/quodlibet"
COMMAND=$1
CONTROL=~/.quodlibet/control

pidof $PLAYER

help() {
	cat << EOF
		Available commands:
	play-pause
	stop
	next
	previous
	hide
	show
	toggle-window
	rate
	fix
	show-or-open
EOF
}

case "$COMMAND" in 
  # "play-pause") $PLAYER --toggle-playing;;
  # "stop") $PLAYER --pause;;
  # "next") $PLAYER --next;;
  # "previous") $PLAYER --previous;;
  # "hide") $PLAYER --hide;;
  # "show") $PLAYER --show;;
  # *) echo "Incorrect command."
     # exit 1;;
  "play-pause") 
	echo "play-pause" > $CONTROL
	 gnome-osd-client "$(quodlibet --status | cut -d' ' -f1)";;
  "stop") echo "pause" > $CONTROL;;
  "next") echo "next" > $CONTROL;;
  "previous") echo "previous" > $CONTROL;;
  "hide") $PLAYER --hide-window;;
  "show") $PLAYER --show-window;;
  "toggle-window") $PLAYER --toggle-window;;
  "rate")
		case "$2" in
			0) $PLAYER --set-rating 0.0;;
			1) $PLAYER --set-rating 0.25;;
			2) $PLAYER --set-rating 0.5;;
			3) $PLAYER --set-rating 0.75;;
			4) $PLAYER --set-rating 1.0;;
		esac;;
  "show-or-open")
	  if ps x | grep quod | grep -v grep >/dev/null 2>&1; then
		$PLAYER --toggle-window
	  else
		$PLAYER --start-playing
	  fi;;
  "fix") 
	if ! ps x | grep quod | grep -v grep >/dev/null 2>&1; then
		rm $CONTROL
	fi;;
  *) echo "Incorrect command."
     help
     exit 1;;
esac
