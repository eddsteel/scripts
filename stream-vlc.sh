#!/usr/bin/env bash

host="$(echo "$1" | cut -d: -f1)"
file="$(echo "$1" | cut -d: -f2)"

echo "$host" "$file"

cvlc udp:// -q &
ssh $host vlc "$file" --sout udp://$(hostname)

killall vlc # TODO use pid
