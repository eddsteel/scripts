#!/usr/bin/env bash
# Automate decryption of thumbdrive and
# execution of keepassx off it.

# File locations
DEV="/dev/sdb1"
# DEV="/srv/card1"
THUMB=/mnt/thumb
KEY=$THUMB/passwords/key
DB=$THUMB/passwords/db.kdb

# Commands and arguments
KPX=/usr/bin/keepassx
TCT=/usr/bin/truecrypt
TCO='-t --protect-hidden=no'
XCL=/usr/bin/xclip
XCO='-i -selection clipboard'

# Mount thumbdrive
mount() {
	$TCT -p "$1" -k "" $TCO "$DEV" "$THUMB"
}

# Mount thumbdrive if it's not yet mounted
while [ ! -f $KEY ]; do
	password=$(zenity --entry --text "Enter volume password"\
		--entry-text="" --hide-text)
	if [ $? -gt 0 ]; then exit 5; fi
	mount "$password"
done

# Copy key location to clipboard and open passwords
if [ -f $KEY ]; then
	echo -n "$KEY"| $XCL $XCO
	$KPX $DB
fi
