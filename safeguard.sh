#!/bin/bash
# Test for remote file. If it's there, open a tunnel back here.
#

if wget -q http://static.eddandkrista.com/sshreverse; then 
	ssh -N -R 2900:localhost:22 ec2
fi
