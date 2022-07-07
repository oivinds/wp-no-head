#!/bin/sh

if [ -z "$1" ]; then 
    echo "Pass random key and container "
    exit 1
fi


scriptpath="$(dirname -- $0)/move/insert.sh"

docker cp $scriptpath $2:/var/www/html &&
docker exec -t $2 sh -c "/var/www/html/insert.sh $1" &&
docker exec -t $2 rm /var/www/html/insert.sh &&
echo "all done!";
