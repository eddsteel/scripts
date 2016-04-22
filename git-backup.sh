#!/bin/sh

name=$(basename $(pwd))

git init
git add .
git commit -m initial
git init-remote $name.git
git remote add origin git@eddsteel.com:$name.git
git push origin master
