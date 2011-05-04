#!/usr/bin/env bash
#

remote=master

if [ -d /mnt/thumb/repo ]; then
	remote=card
fi

for d in  ~/.homesick/repos/*;
do cd $d; git pull $remote master; done
