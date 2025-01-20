FROM        debian:bullseye
RUN         apt update
RUN         apt install -y wget\
            php7.4\
            php-fpm\
            php-mysql\
            mariadb-client
RUN         wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz
RUN         mkdir -p /var/www/
RUN         tar -xzf wordpress-6.4.3-fr_FR.tar.gz -C /var/www/ && rm wordpress-6.4.3-fr_FR.tar.gz
RUN         chmod 755 /var/www/wordpress
RUN         chown -R root:root /var/www/wordpress
RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x wp-cli.phar
#RUN         mv wp-cli.phar /usr/local/bin/wp
RUN         echo "listen=9000" >> /etc/php/7.4/fpm/pool.d/www.conf 
COPY	    ./conf/entrypoint.sh /entrypoint.sh
RUN         chmod 755 /entrypoint.sh
EXPOSE      9000
ENTRYPOINT  ["./entrypoint.sh"]
