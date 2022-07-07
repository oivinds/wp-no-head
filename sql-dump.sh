#!/usr/bin/env bash

readarray names <<< $(docker ps --format="{{.Names}}")
dest=./dump
date=$(date +%Y-%m-%dT%H%M%S%z)
select name in ${names[@]}
do
  echo "try dumping from container $name into $dest"
  source .env &&
  docker exec -it $name mysqldump -u${MYSQL_USER} -p${MYSQL_PASSWORD}  ${MYSQL_DATABASE} > \
  "${dest}/${date}-${MYSQL_DATABASE}.sql" 
  if [ "$?" -ne 0 ] ; then
    echo "error"
    exit 1;
  else  
    echo "sweet, but verify output"
    exit 0;
  fi

   
done




