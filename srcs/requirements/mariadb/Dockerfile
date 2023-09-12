FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server mariadb-client

ARG MYSQL_USER
ARG MYSQL_DATABASE
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/mariadb.sh /tmp/mariadb.sh
RUN chmod +x /tmp/mariadb.sh

# permet démarrer MySQL, sans quoi il sera difficile de le configurer :
RUN service mysql start

EXPOSE 3306

CMD ["mysqld"]