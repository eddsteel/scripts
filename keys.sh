#!/usr/bin/env bash
# Automate decryption of thumbdrive and
# execution of keepassx off it.

# File locations
DEV="/dev/disk/by-id/usb-Multi_Flash_Reader_058F0O1111B1-0:0-part1"
AUTORUN="/mnt/thumb/attach.sh"
THUMB=/mnt/thumb
KEY=$THUMB/private/passwords/key
DB=$THUMB/private/passwords/db.kdb

# Commands and arguments
KPX=/usr/bin/keepassx
TCO='-t --protect-hidden=no'
XCL=/usr/bin/xclip
XCO='-i -selection clipboard'

# Mount thumbdrive
mount() {
	sudo mount -tvfat $DEV $THUMB -ogid=1000,uid=1000
}

autorun() {
	sh $AUTORUN
}

# Mount thumbdrive if it's not yet mounted
while [ ! -f $KEY ]; do
	while [ ! -f $AUTORUN ]; do
		mount
	done
	autorun
	if [ $? -gt 0 ]; then exit 5; fi
done

# Copy key location to clipboard and open passwords
if [ -f $KEY ]; then
	echo -n "$KEY"| $XCL $XCO
	nohup $KPX $DB
fi
