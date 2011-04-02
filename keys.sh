#!/usr/bin/env bash
# Automate decryption of thumbdrive and
# execution of keepassx off it.

# File locations
DEV="/dev/disk/by-id/$(readlink /dev/disk/by-id/usb-Generic_USB_SD_Reader_12345678901234567890-0:0-part1)"
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
	$TCT -k "" $TCO "$DEV" "$THUMB"
}

# Mount thumbdrive if it's not yet mounted
while [ ! -f $KEY ]; do
	mount
done

# Copy key location to clipboard and open passwords
if [ -f $KEY ]; then
	echo -n "$KEY"| $XCL $XCO
	$KPX $DB
fi
