#!/usr/bin/env bash
#

for d in  ~/.homesick/repos/*;
do cd $d; git pull; done
