#!/usr/bin/env bash
#

remote=""

if ping -w 2  google.com > /dev/null 2>&1; then
	remote=master
fi

if [ -d /mnt/thumb/repo ]; then
	remote="$remote card"
fi

for d in  ~/.homesick/repos/*; do
	for r in $remote; do
		cd $d; git pull $remote master;
	done
done
