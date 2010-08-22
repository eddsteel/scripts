#!/bin/bash
# et.sh -- created 08/09/2007, Edward Steel
# @Last Change: 24-Dez-2004.
# @Revision:    0.0


if lsmod | grep -q "^snd_pcm_oss"
	then modprobe snd_pcm_oss
fi


echo "et.x86 0 0 direct" > /proc/asound/card0/pcm0p/oss
echo "et.x86 0 0 disable" > /proc/asound/card0/pcm0c/oss

et

# vi: 
