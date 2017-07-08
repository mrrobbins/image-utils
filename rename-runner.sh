#!/bin/bash

# runs a directory analysis and prompts the user before renaming
# requires the script directory to be on the path

# output color commands
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

dir-analyzer.sh

echo -n "${red}Rename these files? [y]:${reset} "
read renameConfirmation

if [ "$renameConfirmation" == "y" ]
then
  datetime-renamer.sh
  echo "${green}finished!${reset}"
else
  echo Aborting...
fi
