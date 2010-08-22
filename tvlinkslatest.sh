#!/usr/bin/env bash
# tvlinkslatest.sh -- copyright 2007, Edward Steel
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# requires sed, curl, grep
O="/tmp/feed.rss"

cat - <<END >$O
<?xml version="1.0" encoding="ISO-8859-1"?> 

<rss version="2.0">
  <channel>
    <title>TV Links</title>
    <link>http://www.tv-links.co.uk</link>
    <description>Recent Updates</description>
    <language>en-us</language>
    <generator>Edd + BASH</generator>
END

curl -s http://www.tv-links.co.uk | grep -A 100 "Recent Updates" \
| egrep "^[ ]*<li>" |  \
sed \
's![ ]*<li><a href="\([^"]*\)">\([^<]*\)<.*!\
    <item> \
      <title>\2</title> \
      <link>http:\/\/www.tv-links.co.uk\1</link> \
    </item>\
!g' >>$O

cat - <<END >>$O
  </channel>
</rss>
END

cat $O
rm $O
# vi: tw=78
