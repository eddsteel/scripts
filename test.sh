#!/usr/bin/env bash
oldname="$*"

#if echo "$oldname" | grep "\.pdf$"; then
	
  newname=$(echo "$oldname" | sed 's/\.\([a-z[a-z]][a-z]\)/-bw.\1/')
  
  convert "$oldname" -type grayscale  "$newname" | zenity --progress \
    --pulsate --auto-close --text="Saving $newname" 1>/dev/null 2>&1
  
  if test -f $newname; then
    zenity --info --text="$newname has been saved"
  else
    zenity --error --text="failed to save $newname"
  fi

#else
  #zenity --warning --text="Check yo self fool. PDFs only."
#fi
