#!/usr/bin/env bash
#
# Updates homesick repos from any available remotes.
#
# Fails on first merge conflict.
#

test_remotes="master card"
remote=""

for r in $test_remotes; do
	if git fetch $r > /dev/null 2>&1; then
		remote="$remote $r"
	else
		echo "Can't reach $r."
	fi
done

for d in  ~/.homesick/repos/*; do
	for r in $remote; do
		cd $d; git pull $remote master;
	done
done
