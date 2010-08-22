#!/bin/bash
IN=$1
OUT=html/$(echo $IN | sed -e 's!.otl!!' -).html

~/bin/otl2html.py  $IN > $OUT
sed -i 's!<ol>!<ul>!g' $OUT
sed -i 's!</ol>!</ul>!g' $OUT

