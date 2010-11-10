#!/usr/bin/env bash
# Install everything in ~/TOINSTALL then delete it.

toi=~/TOINSTALL

sudo aptitude update -q2 || exit $?
cat toi | while read pkg
do
	sudo apt-get install -q2 -y $pkg || exit $?
done
