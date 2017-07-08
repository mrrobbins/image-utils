#!/bin/bash

exiftool \
  -fileOrder DateTimeOriginal \
  -fileOrder CreateDate \
  -fileOrder filename \
  -p '$filename' \
  -q .
