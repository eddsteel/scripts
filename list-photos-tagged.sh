#!/bin/bash
DB=~/.config/f-spot/photos.db
tag_id=$(sqlite3 $DB "select id from tags where name = '$1'")

sqlite3 $DB "select photo_id from photo_tags where tag_id = $tag_id" | while read photo_id
do sqlite3 -separator / $DB "select base_uri, filename from photo_versions where photo_id = $photo_id order by version_id desc limit 1" | cut -d/ -f3- | sed -e 's/%20/\ /g' 
done
