#!/usr/bin/env bash
#

cd ~/.private-edd/home
date="`date`"
git commit TODO -m "home: $date"
git push origin master
git push card master
