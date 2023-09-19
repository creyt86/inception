#!/bin/bash

mkdir -p /run/php

cd /var/www/wordpress

wp config create --path="/var/www/wordpress" --allow-root --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}"

wp core install \
    --path="/var/www/wordpress" \
    --url=${WP_URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN_NAME} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --admin_password=${WP_ADMIN_PWD} \
    --skip-email \
    --allow-root

wp user create --allow-root \
    ${WP_USER_NAME} \
    ${WP_USER_EMAIL} \
    --role=author \
    --user_pass=${WP_USER_PWD}

/usr/sbin/php-fpm7.3 --nodaemonize