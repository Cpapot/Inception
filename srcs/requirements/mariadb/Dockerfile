FROM debian:buster

EXPOSE	3306

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt install vim -y && apt install curl -y

COPY ./conf/createDB.sh ./createDB.sh
RUN chmod 777 ./createDB.sh

ENTRYPOINT	["./createDB.sh"]
CMD			["mysqld", "--bind-address=0.0.0.0"]
