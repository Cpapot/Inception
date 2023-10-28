FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt install vim -y && apt install curl -y
ENV SQL_DATABASE="data"
ENV SQL_USER="user"
ENV SQL_PASSWORD="1234"
ENV SQL_ROOT_PASSWORD ="1234"

COPY ./conf/createDB.sh ./createDB.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN sh createDB.sh
