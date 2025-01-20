FROM    debian:bullseye
RUN     apt update && apt install nginx -y
RUN     mkdir -p /etc/nginx/ssl
RUN     apt install openssl -y
#Generates a self-signed SSL certificate and a corresponding private key.
RUN     openssl req -x509 -nodes \ 
        -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \ 
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=arincon.42.fr/UID=arincon"
RUN     mkdir -p /var/run/nginx
COPY    conf/nginx.conf /etc/nginx/sites-available/wordpress
RUN     ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress 
#This is often necessary to allow the web server to access and 
#serve files in this directory
RUN     chmod 755 /var/www/html
#Changes the owner and group of the /var/www/html directory to www-data.
#This is crucial for security and functionality, as Nginx runs as the www-data user,
#and it needs the necessary permissions to read, write, and execute files in this directory
RUN     chown -R www-data:www-data /var/www/html
EXPOSE  443
CMD     [ "nginx", "-g", "daemon off;" ]