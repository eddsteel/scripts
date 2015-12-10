#!/bin/sh
FIFO=/tmp/ovpn.fifo
USER="edward.steel"
PASS=$(pass vpn)

[ -p $FIFO.auth ] || mkfifo -m 600 $FIFO.auth
[ -p $FIFO.config ] || mkfifo -m 600 $FIFO.config

echo -ne "$USER\n$PASS\n" > $FIFO.auth &
gpg --decrypt ~/.secrets/work.ovpn.gpg > $FIFO.config &

sudo openvpn --config $FIFO.config --auth-user-pass $FIFO.auth
