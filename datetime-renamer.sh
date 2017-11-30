#!/bin/bash

# Copy and rename media files with the given extension to an output directory.
# Output files to subdirectory named "renamed-output". Original files are preserved.
# Process the files in ascending order. Sorted by DateTimeOriginal tag, then CreateDate tag, then Filename.

# This script favors a date formatted filename. For each file, it attempts the following renaming strategies, in order, based on the available metadata tags in the file, where last-one-wins:
## Strategy 1: Simple, sequential zero-based index. Max 1000 files.
### Format: ###_0.extension
### Example: "000_0.jpg", "001_0.jpg", ..., "999_0.jpg"

## Strategy 2: Date format using CreateDate tag (useful for videos files which typically omit the DateTimeOriginal tag)
### Format: YYYY-mm-dd_HH:MM:SS_##_0.extension
### Example: "2017-01-01_13:30:08_00_0.mp4"

## Strategy 3: Date format using DateTimeOriginal tag. This tag is the most common and reliable (true to when the photo was actually taken) capture tag for photographs.
### Format: YYYY-mm-dd_HH:MM:SS_##_0.extension
### Example: "2017-01-01_13:30:08_00_0.jpg"

# Note: the two-digit field "_##_" in the date formats, after the seconds field.
## This field is for uniquely naming burst shots taken within the same second, using a sequential zero-based index.
## This approach is a substitute for a proper sub-second (e.g. millisecond) time field. The DateTimeOriginal tag does not record sub-second time. Including other tags for recording sub-second time is optional and non-standard between vendors.
## Example: "2017-01-01_00:00:00_00_0.jpg", "2017-01-01_00:00:00_01_0.jpg" -- e.g. two burst shots of a New Years kiss, both taken in the first second after midnight 2017.

# Note: the trailing "_0" in the filename, before the extension. This is a legacy digit meant to handle duplicate files. E.g. copies or edits of an original jpeg image.
# Omitting this field and only adding it manually, on an as-needed basis, is possible.
# However, lexical sorts (e.g. by a file explorer) will place the duplicate (longer filename) BEFORE the original, which is annoying.
# E.g. "foobar_1.jpg" or "foobar_edited.jpg" comes before "foobar.jpg"
# The standardized filename length and format used here will prevent this.

# Note: the "l" modifier in "%le" will lowercase the extension in the renamed file. E.g. [.JPG] --> [.jpg], [.CR2] --> [.cr2]

echo Renaming files in [`pwd`]

exiftool -v \
  -fileOrder dateTimeOriginal \
  -fileOrder createDate \
  -fileOrder fileName \
  '-filename=%.3c_0.%le' \
  '-filename<${createDate}_%.2c_0.%le' \
  '-filename<${dateTimeOriginal}_%.2c_0.%le' \
  -d %Y-%m-%d_%H-%M-%S \
  '-directory<renamed-output/${fileType}' \
  -o renamed-output \
  .
