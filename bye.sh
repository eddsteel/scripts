#!/usr/bin/env bash
#

cd ~/.private-edd/home
date="`date`"
git commit TODO -m "work: $date"
git push
