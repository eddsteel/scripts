#!/usr/bin/env bash
#
# Updates homesick repos from any available remotes.
#
# Fails on first merge conflict.
#

test_remotes="origin card"
remote=""

cd ~/.homesick/repos
for d in ~/.homesick/repos/*; do
	echo $d
	cd $d
	for r in $test_remotes; do
		if git fetch $r > /dev/null 2>&1; then
			git pull $r master;
		else
			echo "Can't reach $r."
		fi
	done
done
