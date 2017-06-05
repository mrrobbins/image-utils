#!/bin/bash

echo Renaming photos in [`pwd`] based on DateTimeOriginal

exiftool -v -fileOrder DateTimeOriginal -fileOrder FileName '-filename<DateTimeOriginal' -d %Y-%m-%d_%H-%M-%S_%%.2c_0.%%le -ext JPG -ext CR2 -ext NEF -ext xmp .
