#!/bin/bash


# cd /var/www/wordpress

./wp-cli.phar config create     --path=/var/www/wordpress --allow-root \
                                --dbname=$SQL_DATABASE \
                                --dbuser=$SQL_USER \
                                --dbpass=$SQL_PASSWORD \
                                --dbhost=mariadb:3306

./wp-cli.phar core install      --path=/var/www/wordpress --allow-root \
                                --url=https://$DOMAIN_NAME \
                                --title=$WP_TITLE \
                                --admin_user=$WP_ADMIN_USER \
                                --admin_password=$WP_ADMIN_PASSWORD \
                                --admin_email=$WP_ADMIN_EMAIL \
                                --skip-email


./wp-cli.phar user create       --path=/var/www/wordpress --allow-root \
                                $WP_USER_LOGIN \
                                $WP_USER_EMAIL \
                                --user_pass=$WP_USER_PASSWORD

mkdir -p /run/php

exec /usr/sbin/php-fpm7.4 -F

