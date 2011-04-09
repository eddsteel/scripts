#!/usr/bin/env bash
while [ 1 ]; do fetchmail -k -m /usr/bin/procmail ; if [ $? -eq 1 ]; then exit; fi; done
