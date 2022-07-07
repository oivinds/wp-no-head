#!/usr/bin/env bash

# Tighten acl after wordpress install, runs in container

docker exec -t $1 chown www-data:www-data -R wp-content && \
chmod 755 wp-content && \
find ./wp-content -type d -exec chmod 755 {} \; &&
find ./wp-content -type f -exec chmod 644 {} \; && 
echo "permission and ownership set"