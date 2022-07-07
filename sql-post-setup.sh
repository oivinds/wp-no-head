#!/usr/bin/env bash

prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}

printf  "Name of container running mysql? " 
read container &&
docker exec -it $container /usr/bin/mysql_secure_installation && \
echo "secure step done"

prompt_confirm "Import sql from file?" || exit 0
printf "sql filename?\n"
read sqlPath &&
printf "Reading sql connection info from .env file\n"
source .env && 
docker exec -i $container mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < $sqlPath && echo "done import sql"


