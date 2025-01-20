FROM        debian:bullseye
RUN         apt update && apt install mariadb-server mariadb-client procps -y
RUN         mkdir -p /var/run/mysql && chown mysql:mysql /var/run/mysql && chmod 755 /var/run/mysql
RUN         mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql && chmod 755 /var/lib/mysql
COPY        conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	    ./conf/entrypoint.sh /entrypoint.sh
RUN         chmod 755 /entrypoint.sh
EXPOSE      3306
ENTRYPOINT  ["./entrypoint.sh"]
