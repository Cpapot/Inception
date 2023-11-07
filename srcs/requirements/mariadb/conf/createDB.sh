#!/bin/bash
#db_name = Database Name
#db_user = User
#db_pwd = User Password

	echo -e "Creating DataBase"
	service mysql start;
	echo "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" > db1.sql
	echo "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';FLUSH PRIVILEGES;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> db1.sql

	mysql < db1.sql
	echo -e "DataBase created"

	echo -e "Restarting mysql"
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

	echo -e "DataBase restarted"
	exec "$@"
