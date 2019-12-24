#!/bin/sh

while :; do
  date=$(date +'%d/%m %H:%M')
  bats=$(batteries -q)
  np=$(b np get)
  vol=$(pamixer --get-volume-human)
  net=$(nmcli -t --fields IP4-CONNECTIVITY dev | grep -q 'full' && echo -n "📶" || echo -n " ")
  echo "$np $bats 🔈$vol $net $date"
  sleep 1
done
