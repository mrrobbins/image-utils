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
	
    if [ ! -f $targetFilename ]
    then
      echo "$1 --> $targetFilename"
      mv $1 $targetFilename
      break
    else
      sequence=$((sequence+1)) 
    fi
  done
}

files=$(ls -p | grep -v /)
for f in $files
do
  rename "$f"
done

