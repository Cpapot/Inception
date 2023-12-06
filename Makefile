COMPOSE = docker compose -f srcs/docker-compose.yml

DATA_PATH	= ${HOME}/data
WP_PATH		= ${HOME}/data/wordpress
DB_PATH		= ${HOME}/data/mariadb

all:
	${MAKE} data
	${MAKE} up

up:
	$(COMPOSE) up --build

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

clean:
	$(COMPOSE) down --volumes --rmi all

re: fclean
	${MAKE} all

data:
	mkdir -p ${DATA_PATH}
	mkdir -p ${DB_PATH}
	mkdir -p ${WP_PATH}

.PHONY: re fclean clean restart down up all data

