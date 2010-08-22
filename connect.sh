#!/bin/bash
# connect.sh -- created 10/11/2007, Edward Steel
# @Revision:    0.0

PASSWORD=tarragon
SERVER=192.168.2.1
LOGIN=$SERVER/cgi-bin/login.exe
PROCESS=$SERVER/cgi-bin/statusprocess.exe

say() 
{
  if [ "$DISPLAY" != "" ]; then
  	zenity --info --text "$1" --title "$2"
  else
	echo $1
  fi
}

curl  $LOGIN --silent -L -d pws=$PASSWORD >/dev/null 2>&1
curl $PROCESS --silent -L -d connectA=+Connect+ | grep "^var bWanConnected=1;" >/dev/null 2>&1
if [ $? -le 0 ]
then
	say "connected!" "Success"
	exit 0;
else
	say  "Perhaps the router is already connected" "Failed"
fi
