#!/bin/bash
# Test for remote file. If it's there, open a tunnel back here.
#

if ping -c 1 -w 5 static.eddandkrista.com >/dev/null 2>&1; then
	if wget -q http://static.eddandkrista.com/sshreverse; then 
		ssh -N -R 2900:localhost:22 ec2
	fi
fi
