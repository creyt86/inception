FROM debian:buster

RUN apt update -y \
    && apt-get php php-mysqli php-fpm wget mariadb-client -y

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/ /usr/local/bin/


EXPOSE 9000