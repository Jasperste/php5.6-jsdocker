FROM php:5.6-apache

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev libpq-dev
RUN docker-php-ext-install opcache
RUN docker-php-ext-install intl
RUN docker-php-ext-install pdo_mysql
# Enable Apache2 rewrite module
RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN service apache2 restart

#DEBUG
RUN httpd -S

#RUN ["cp", "/etc/apache2/mods-available/rewrite.load", "/etc/apache2/mods-enabled/"]