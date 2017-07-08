#!/bin/bash

# prints the count of files in the current directory, grouped by extension

# find . -type f | awk -F"." '{print $NF}' | sort | uniq -c

find . -type f | sed 's/.*\.//' | sort | uniq -c
