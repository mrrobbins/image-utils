#!/bin/bash

echo Renaming photos in [`pwd`] based on DateTimeOriginal with extension [$1]

exiftool -v -fileOrder DateTimeOriginal -fileOrder FileName '-filename<DateTimeOriginal' -d %Y-%m-%d_%H-%M-%S_%%.2c_0.%%le -ext $1 .
