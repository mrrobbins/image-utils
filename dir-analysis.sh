#!/bin/bash

# prints the count of files in the current directory, grouped by extension

echo Analyzing contents of [`pwd`]

shallowDirCount=`find ./* -maxdepth 0 -type d | wc -l | xargs`
echo "Level-0 Directory count: [$shallowDirCount]"

if [ $shallowDirCount -gt 0 ]
then
  deepDirCount=`find ./* -type d | wc -l | xargs`
  echo "Level-N directory count: [$deepDirCount]"

  if hash tree 2>/dev/null # check if tree program is on path
  then
    echo "--Directory Tree--"
    tree -d -C --noreport
  else
    echo "--Directory List--"
    find ./* -type d
  fi
fi

# find . -type f | awk -F"." '{print $NF}' | sort | uniq -c
fileCount=`find ./* -type f | wc -l | xargs`
echo "File count: [$fileCount]"

echo "--File count grouped by extension--"
find . -type f | sed 's/.*\.//' | sort | uniq -c
