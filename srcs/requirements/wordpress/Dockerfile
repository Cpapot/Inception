FROM debian:buster

EXPOSE	9000

#Update docker
RUN apt-get update -y && apt-get upgrade -y

#Setting up the docker
RUN apt-get -y install wget && apt-get -y install vim && apt-get -y install curl
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

#Setting up wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN		cp wp-cli.phar /usr/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

COPY conf/configWP.sh ./configWP.sh
RUN chmod 777 ./configWP.sh
ENTRYPOINT [ "./configWP.sh" ]

CMD		["/usr/sbin/php-fpm7.3", "--nodaemonize"]
