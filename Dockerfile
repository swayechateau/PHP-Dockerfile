FROM php:8.0.10-apache
# update base container ubuntu OS
RUN apt-get update -y
# change apache root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
# update apache default conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# install composer
RUN curl -sS https://getcomposer.org/installer | php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# install git
RUN apt install git -y
# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt install nodejs -y

EXPOSE 80