#!/usr/local/bin/bash

# will exit on error
set -e

# Check bash version

function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

current_version=${BASH_VERSION}
#read -i flag not supported before 4.0\n" 
min_version=4.0.0
if version_gt $min_version $current_version; then
      echo "Your bash version is $current_version. Upgrade bash to > $min_version !" && exit 1
fi


# Suggested filepath
src=./wp-content/
dest=/var/www/html/

# START PROMPT
printf  "container name \n" 
read container 

read -p "Press enter to use default source, or provide custom path " -e -i $src srcPath
read -p "Press enter to use default destination, or provide custom path " -e -i $dest destPath
 
docker cp $srcPath $container:$destPath && echo "done upload" 

