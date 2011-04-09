#!/usr/bin/env bash
# zip-contents.sh
# Zip contents of directory, if it contains a certain number of files.
#
# Use with find for selective recursive zipping, e.g.:
# find . -type d -exec zip-contents.sh '{}' \;
# Will iterate over all directories, and place a zip containing
# the contents of that directory inside, if there are enough files
# to make it worthwhile.

THRESHOLD=5
DIR=$1

function prettify_name {
	echo $1 | sed -e 's!^./!!' -e 's!/! - !g'
}


if [ $(find "$DIR" -maxdepth 1 -type f | wc -l) -gt $THRESHOLD ]
then
	echo "Zipping $DIR"
	ANAME=$(prettify_name "$DIR")
	rm -f "$DIR"/*.zip
	rm -f "$DIR"/*.tar.gz
	zip -q "$DIR/$ANAME.zip" "$DIR"/*
	tar -zcf "$DIR/$ANAME.tar.gz" "$DIR"/* --exclude "$ANAME.zip"
else
	echo "Skipping $DIR"
fi

