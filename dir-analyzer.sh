#!/bin/bash

# prints the count of files in the current directory, grouped by extension

echo Analyzing contents of [`pwd`]

shallowDirCount=`find ./* -not -path '*/\.*' -maxdepth 0 -type d | wc -l | xargs`
echo "Shallow directory count: [$shallowDirCount]"

if [ $shallowDirCount -gt 0 ]
then
  recursiveDirCount=`find ./* -not -path '*/\.*' -type d | wc -l | xargs`
  echo "Recursive directory count: [$recursiveDirCount]"

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
recursiveFileCount=`find . -not -path '*/\.*' -type f | wc -l | xargs`
echo "Recursive file count: [$recursiveFileCount]"

shallowFileCount=`find . -not -path '*/\.*' -type f | wc -l | xargs`
echo "Shallow file count: [$shallowFileCount]"

echo "--Recursive file count grouped by extension--"
find . -not -path '*/\.*' -type f | sed 's/.*\.//' | sort | uniq -c

echo "--Shallow file count grouped by extension--"
find . -not -path '*/\.*' -maxdepth 1 -type f | sed 's/.*\.//' | sort | uniq -c
