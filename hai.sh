#!/usr/bin/env bash
#
# Start the day.
#

build_tmux_session_command() {
	cmd="tmux -2 new -d -s tmux @@@ source $HOME/.tmux.conf"
	for file in ~/.tmux.d/enabled/*; do
		cmd="$cmd @@@ source $file"
	done
	# to avoid escaping each time \; is added
	cmd=$(echo $cmd | sed 's/@@@/\;/g')
	$cmd
}

echo "Hai!"
if $(which kinit); then
	kinit
fi

echo "-> Building tmux session"
build_tmux_session_command

echo "-> mr up"
mr -qi up

echo "-> Projects, mr up"
cd ~/Projects; mr -qi up; cd -

echo "-> rebuilding tags"
/usr/local/bin/ctags -R -f ~/.tags ~/Projects &

tmux attach -t tmux

