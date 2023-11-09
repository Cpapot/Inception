FROM debian:buster

EXPOSE	443

RUN apt-get update && apt update
RUN apt-get install -y apt-transport-https && apt install -y nginx
RUN apt install vim -y && apt install curl -y && apt-get install openssl libssl-dev -y
RUN mkdir -p /etc/nginx/ssl && mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/sites-enabled/default

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=cpapot.42.fr/UID=cpapot"
RUN chmod 755 /var/www/html
RUN exec "$@"

CMD ["nginx", "-g", "daemon off;"]
