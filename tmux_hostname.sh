#!/usr/bin/env zsh
tmux_var() {
	key=$1
	tmux display -p | sed "s/^\[\([^]]*\)\] \([0-9]*\):.* current pane \([0-9]*\).*/TM\1\2_\3_$key/" 
}

get_tmux_var() {
	line=$(tmux show-environment | grep --color=never $(tmux_var $1))
	if [ $? -gt 0 ]; then
		return 1
	else
		echo $line | cut -f2 -d=
	fi
}

local=$(hostname -s)
name=$(get_tmux_var "hostname" || echo $local)

if [ $local = $name ]; then
	echo "#[fg=colour241]#[bg=colour233]$name #[fg=colour233]#[bg=colour234]⮀"
else
	echo "#[bg=colour166]#[fg=colour233]$name #[fg=colour166]#[bg=colour234]⮀"
fi
