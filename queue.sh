#!/usr/bin/env bash
#
# Add arguments to ~/TOINSTALL

for i in $*; do echo $i >> ~/TOINSTALL; done
