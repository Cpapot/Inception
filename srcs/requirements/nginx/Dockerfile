FROM debian:buster

EXPOSE	443

#Update docker
RUN apt-get update && apt update
RUN apt-get install -y apt-transport-https && apt install -y nginx
RUN apt install vim -y && apt install curl -y && apt-get install openssl libssl-dev -y

RUN mkdir -p /etc/nginx/ssl
RUN rm -rf /var/lib/apt/lists/*
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/private/nginx.key -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=cpapot.42.fr/UID=cpapot"

CMD ["nginx"]
