# Image Utils

A collection of bash scripts for organizing and renaming photos. These scripts require `Exiftool` be installed.

## ExifTool

An open source command line tool for reading and writing metadata from image and video files.

http://www.sno.phy.queensu.ca/~phil/exiftool/

### Installing ExifTool

Instructions: https://www.sno.phy.queensu.ca/~phil/exiftool/install.html

Alternatively, on Macs, install from Homebrew:

In terminal, run:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install exiftool
```

### Useful links

http://ninedegreesbelow.com/photography/exiftool-commands.html

File renaming: http://www.sno.phy.queensu.ca/~phil/exiftool/filename.html

Superseding action commands http://u88.n24.queensu.ca/exiftool/forum/index.php/topic,5079.msg24483.html#msg24483

## Utils

### `dir-analyzer.sh`

#### How to runs

```
cd to/images/dir

/path/to/rename-runner.sh
```

Sample output
```
Analyzing contents of [/Users/mrobbins/Pictures/2017]
Shallow directory count: [2]
Recursive directory count: [4]
--Directory Tree--
.
├── Beach\ Vacation
│   └── jpegs
│   └── raw
└── Friends\ Wedding
    └── jpegs

Recursive file count: [160]
Shallow file count: [50]
--Recursive file count grouped by extension--
  70 jpg
  40 cr2
--Shallow file count grouped by extension--
  50 jpg
```

### `datetime-renamer.sh`

Renames images and videos based on capture timestamp and puts the renamed files (copies) into a sub directory `rename-output`.

#### How to run

```
cd to/images/dir

/path/to/datetime-renamer.sh
```

Runs for all photos in the current directory (non-recursive).

### `rename-runner.sh`

Combines `dir-analyzer.sh` and `datetme-renamer.sh` with a user confirmation prompt before running the renaming.

#### How to run

```
cd to/images/dir

/path/to/rename-runner.sh
```

### `print-filename-sorted-datetime.sh`

Prints all filenames to standard out, sorted by capture timestamp.
