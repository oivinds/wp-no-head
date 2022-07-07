#!/bin/sh



pre='<IfModule mod_rewrite.c>
RewriteEngine On
RewriteCond %{HTTP:Authorization} ^(.*)
RewriteRule ^(.*) - [E=HTTP_AUTHORIZATION:%1]
</IfModule>'

docker exec  $1 sh -c "if grep -Fq 'HTTP_AUTHORIZATION' .htaccess ; then
  echo 'HTTP_AUTHORIZATION already added to .htaccess, aborting'
  exit 1;
else
  exit 2
fi"

if [ $? -eq 2 ]; then
  echo 'continue'
else
  exit 1
fi  
 
docker exec -t $1 sh -c "cat .htaccess > temp" && 
docker exec -t $1 sh -c "echo '$pre' >  .htaccess" &&
docker exec -t $1 sh -c "cat temp >>  .htaccess" &&
echo "Authorization header prepended to .htaccess"


 