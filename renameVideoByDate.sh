#!/bin/bash

function rename() 
{
  datetime=$(exiftool -CreateDate -s3 $1)
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
      mv $1 $targetFilename
      break
    else
      secondSequence=$((secondSequence+1)) 
    fi
  done
}

files=$(ls -p | grep -v /)
for f in $files
do
  rename "$f"
done

