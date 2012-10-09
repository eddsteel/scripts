#/usr/bin/bash

sys=$(uname -s)

case $sys in
	Linux)
		echo " $(cat /proc/loadavg | cut -f1-3 -d' ')"
		;;
	Darwin)
		w | head -n 1 | cut -f 4 -d:
		;;
	*) echo " 0.0 0.0 0.0" ;;
esac
