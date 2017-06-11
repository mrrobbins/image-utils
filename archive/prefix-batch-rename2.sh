#!/bin/bash

PREFIX=$1

function rename()
{
  extension=${1##*.}
  sequence=0
  while true
  do
    formattedSequence=$(printf "%03d" $sequence)
    targetFilename=""
    if [ -z $PREFIX ]
    then
    	targetFilename=${formattedSequence}_0.${extension}
    else
    	targetFilename=${PREFIX}_${formattedSequence}_0.${extension}
    fi

    if [ ! -f batch-renamed/$targetFilename ]
    then
      echo "$1 --> batch-renamed/$targetFilename"
      cp $1 batch-renamed/$targetFilename
      break
    else
      sequence=$((sequence+1))
    fi
  done
}

mkdir batch-renamed
files=$(exiftool -fileOrder DateTimeOriginal -fileOrder CreateDate -fileOrder filename -p '$filename' -q .)
for f in $files
do
  rename "$f"
done
