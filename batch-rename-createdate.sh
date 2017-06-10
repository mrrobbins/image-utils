#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Extension filter required!"
    exit 1
fi

echo Renaming photos in [`pwd`] based on CreateDate with extension [$1]

exiftool -v -fileOrder CreateDate -fileOrder FileName '-filename<CreateDate' -d %Y-%m-%d_%H-%M-%S_%%.2c_0.%%le -ext $1 . -o batch-renamed/
