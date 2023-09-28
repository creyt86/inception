FROM debian:buster

RUN apt-get update && apt-get upgrade -y
# RUN apt-get install php php-mysqli php-fpm wget mariadb-client -y
RUN apt-get install -y wget curl php7.3 php7.3-fpm php-mysql mariadb-client

#install wget dans le dossier /var/www
RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
#va dans le dossier /var/www et utiliser tar -xvf suivi du fichier pour le décompresser et en obtenir le dossier  wordpress
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz
#donner les droits à root d’écrire dans ce dossier.
RUN	chown -R root:root /var/www/wordpress
#CLI permet de configurer les infos dont a besoin WP pour fonctionner
#Une CLI c'est une interface textuelle qui traite les commandes vers un programme informatique.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/entrypoint.sh /entrypoint.sh

EXPOSE 9000

RUN chmod +x /entrypoint.sh

# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
CMD ["/entrypoint.sh"]