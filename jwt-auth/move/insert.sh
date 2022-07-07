#!/bin/sh

# if grep -Fq "JWT" wp-config.php ; then
#  echo "jwt already exists, aborting"
#  exit 1
# fi

if [ -z "$1" ]; then 
    echo "you need to pass the key!"
    exit 1
fi

# Must be inserted before wp-settings! 
insert='define("JWT_AUTH_SECRET_KEY","'$1'");'
# returns the linenumber 
ln=$(sed -n '/Sets up WordPress vars and included files/=' wp-config.php)

# inserts at linenumber
awk -v "ln=$ln" -v "insert=$insert" 'NR==ln{print insert}1' wp-config.php > tmp && mv tmp wp-config.php
