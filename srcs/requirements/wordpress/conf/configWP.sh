#!/bin/bash

#checking that WordPress is not already config, if not config it
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	echo -e "downloading Worpress Core"
	wp core download	--path=/var/www/wordpress --allow-root

	wp config create	--dbname=${SQL_DATABASE} \
						--dbuser=${SQL_USER} \
						--dbpass=${SQL_PASSWORD} \
						--dbhost=mariadb:3306 \
						--path=/var/www/wordpress \
						--allow-root

	wp core install		--url="${WP_URL}" \
						--title="${WP_NAME}" \
						--admin_user="${WP_ADMIN_LOGIN}" \
						--admin_password="${WP_ADMIN_PASSWORD}" \
						--admin_email="${WP_ADMIN_EMAIL}" \
						--path=/var/www/wordpress \
						--allow-root

	wp user create		${WP_USER_LOGIN} ${WP_USER_EMAIL} \
						--allow-root \
						--path=/var/www/wordpress
fi


mkdir -p /run/php/;
php-fpm7.3 -F
