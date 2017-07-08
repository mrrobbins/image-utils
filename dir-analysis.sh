#!/bin/bash

# prints the count of files in the current directory, grouped by extension

echo Analyzing contents of [`pwd`]

level0DirCount=`find ./* -maxdepth 0 -type d | wc -l | xargs`
echo "Level-0 Directory count: [$level0DirCount]"

if [ $level0DirCount -gt 0 ]
then
  totalNestedDirCount=`find ./* -type d | wc -l | xargs`
  echo "Level-N directory count: [$totalNestedDirCount]"

  if hash asdf 2>/dev/null
  then
    echo "--Directory Tree--"
    tree -d
  else
    echo "--Directory List--"
    find ./* -type d
    echo
  fi
fi

# find . -type f | awk -F"." '{print $NF}' | sort | uniq -c
fileCount=`find ./* -maxdepth 0 -type f | wc -l | xargs`
echo "File count: [$fileCount]"

echo "--File count grouped by extension--"
find . -type f | sed 's/.*\.//' | sort | uniq -c
