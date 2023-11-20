FROM debian:buster

EXPOSE	3306

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt install vim -y && apt install curl -y

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/init.sql /tmp/
COPY ./conf/createDB.sh ./createDB.sh
RUN chmod 777 ./createDB.sh

ENTRYPOINT	["./createDB.sh"]
CMD			["mysqld_safe"]
