#!/usr/bin/env bash
#
# Start the day.
#

${initial:=true}
. ~/.tmux.d/include/functions
. ~/.zshfunctions/tmux


build_chromium_session() {
	if [ -f ~/.urls ]; then
		cat ~/.urls | while read line; do
			open $line
		done
	fi
}


if [ $initial = true ]; then
	echo "Hai!"
	pgrep gpg-agent >/dev/null && killall gpg-agent
	eval $(gpg-agent --daemon) >/dev/null

	if which kinit >/dev/null; then
		pass -c kinit
		pbpaste | kinit --password-file=STDIN edward
	fi

	if [ -f ~/.autostart ]; then
		cat ~/.autostart | while read app; do
			nohup $app &
		done
	fi

fi

echo "-> Building tmux session"
build_tmux_session
add_projects_to_tmux
tmux set-option default-path $HOME
tmux select-window -t "$session:1" \; rename-window "Home"

if [ $initial = true ]; then
	echo "-> Building Chromium session"
	build_chromium_session

	echo "-> rebuilding tags"
	find Projects -type d -depth 2 -exec tag-dir '{}' \;

	echo "-> mr up"
	mr -qi up

	echo "-> Projects, mr up"
	cd ~/Projects; mr -qi up; cd -
fi

if [ $initial = true ]; then
	rem
	read
fi
tmux -2 attach -t tmux

