FROM php:8.2.7-apache 
RUN yum install -y wget unzip
WORKDIR /app
RUN wget https://files.getcockpit.com/releases/master/cockpit-core.zip
RUN apk add php-curl php-dom php-fileinfo php-gd php-json php-openssl php-zip
RUN unzip cockpit-core.zip && cp -r /app/cockpit-core/* /var/www/html && rm -rf cockpit-core.zip
WORKDIR /app/cockpit-core/install
EXPOSE 80
CMD ["/usr/local/bin/php","-S","0.0.0.0:80","index.php"]
