#!/bin/bash

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
		mkdir -p /var/www/html
		cd /var/www/html
		wp core download 	--allow-root

	wp config create	--dbname=${SQL_DATABASE} \
						--dbuser=${SQL_USER} \
						--dbpass=${SQL_PASSWORD} \
						--dbhost=${SQL_DB_HOST} \
						--path="/var/www/html" \
						--dbcharset="utf8" \
						--dbcollate="utf8_general_ci" \
						--allow-root
	wp core install		--url=${WP_URL} \
						--title=${SQL_DATABASE} \
						--admin_user=${WP_ADMIN_LOGIN} \
						--admin_password=${WP_ADMIN_PASSWORD} \
						--admin_email=${WP_ADMIN_EMAIL} \
						--skip-email \
						--allow-root
	wp user create		--allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} \
						--user_pass=${WP_USER_PASSWORD}
fi

exec "$@"
