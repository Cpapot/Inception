#!/bin/bash

#This script config & start mariaDB
service mysql start;

#checking that mariaDB is not already config, if not config it
if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
	mysql_secure_installation << EOF

	n
	y
	y
	y
	y
EOF

	echo -e "Creating DataBase"
	echo "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" > db1.sql
	echo "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';FLUSH PRIVILEGES;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> db1.sql

	mysql < db1.sql
	echo -e "DataBase created"
fi

#starting mariaDB
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec "$@"
