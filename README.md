# WORDPRESS

`docker-compose up -d`

### Set up wordpress with wp-cli

#### Start wp-cli:
% `./wp-cli.sh wp_no`  
bash-5.1$

### Use wp cli (Wordpress setup)
bash-5.1$ `wp core install --url=localhost:9000 --title="A CMS for headless" --admin_user=admin --admin_password=abc123 --admin_email=no@no.org`
    
### You need pretty urls for wp api.
 
bash-5.1$ `wp option update permalink_structure '/%postname%'`  

### Plugins

bash-5.1$ `wp plugin install jwt-auth`

# JWT authentication configuration: 

### Modify .htaccess for authentication  

% `./jwt-auth/auth_header.sh wp_no` 

### Injects jwt secret into wp-config.php

% `./jwt-auth/inject-secret.sh  mdwk2mJsWnS2ndLM6D4T7 wp_no`  

(TODO: - Any char for token )

# Shell scripts for various tasks

- set-acl.sh - Tighten wordpress access rights 
- sql-dump.sh - sql dump
- sql-post-setup.sh - tasks after sql container up
- wp-content_to_prod.sh copy files to (optionaly default) locations.
