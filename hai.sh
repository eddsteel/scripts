#!/usr/bin/env bash
#
# Start the day.
#

${initial:=true}
. ~/.tmux.d/include/functions


build_chromium_session() {
	if [ -f ~/.urls ]; then
		cat ~/.urls | while read line; do
			open $line
		done
	fi
}


if [ $initial = true ]; then
	echo "Hai!"
	if which kinit; then
		kinit
	fi
fi

echo "-> Building tmux session"
build_tmux_session
add_projects_to_tmux
tmux select-window -t "$session:1" \; rename-window "Home"

if [ $initial = true ]; then
	echo "-> Building Chromium session"
	build_chromium_session

	echo "-> rebuilding tags"
	/usr/local/bin/ctags -R -f ~/.tags ~/Projects&

	echo "-> mr up"
	mr -qi up

	echo "-> Projects, mr up"
	cd ~/Projects; mr -qi up; cd -
fi

tmux -2 attach -t tmux

