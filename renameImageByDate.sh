#!/bin/bash

function rename() 
{
  datetime=$(exiftool -DateTimeOriginal -s3 "$1")
  if [ -z "$datetime" ] 
  then
	echo "$1 has no DateTimeOriginal"
  	# datetime=$(exiftool -FileModifyDate -s3 $1)
	prefixRename "$1"
	return
  fi
  
  formattedDatetime=$(echo $datetime | tr : - | tr " " _)
  extension=${1##*.}
  secondSequence=0
  while true
  do
    formattedSecondSequence=$(printf "%02d" $secondSequence)
    targetFilename=${formattedDatetime}_${formattedSecondSequence}_0.${extension}
    if [ ! -f $targetFilename ]
    then
      echo "$1 --> $targetFilename"
      mv "$1" $targetFilename
      break
    else
      secondSequence=$((secondSequence+1)) 
    fi
  done
}

#files=$(ls -p | grep -v /)
#for f in $
find . -maxdepth 1 -type f | sort | while read f
do
  echo "renaming $f"
  rename "$f"
done

