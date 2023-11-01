FROM debian:buster

#Update docker
RUN apt-get update -y && apt-get install

#Setting up the docker
RUN apt-get -y install wget && apt-get -y install vim
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

#Setting up wordpress
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY conf/wp-config.php /var/www/wordpress/wp-config.php
