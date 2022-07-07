#!/usr/bin/env bash

# temporary WP-CLI container that share your wordpress container's volume. 
# NOTES:  
# - If debian then user 82, alpine is 33
# - Adjust containername and network name to your container

docker run  --user 33:33 -it --rm --volumes-from wp_no --network net_no --env-file .env -e HOME=/tmp wordpress:cli /bin/bash  