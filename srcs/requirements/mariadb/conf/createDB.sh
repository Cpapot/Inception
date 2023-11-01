#!/bin/bash
	service mysql start;
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';FLUSH PRIVILEGES;"
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
	exec mysqld_safe
