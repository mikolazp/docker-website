FROM php:7-fpm

#ADD sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	git \
	mc \
	supervisor \
	rsyslog \
	cron \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libicu-dev \
    && rm -r /var/lib/apt/lists/*


RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
	
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install intl

#Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod 755 /usr/local/bin/composer

RUN composer global require "fxp/composer-asset-plugin:~1.1.1"

# PHP config
#ADD php.ini /usr/local/etc/php/php.ini
#ADD php-fpm.conf /usr/local/etc/php-fpm.conf

ADD crontab /etc/crontab


WORKDIR /www

# Write Permission
#RUN usermod -u 1000 www-data

ENV TERM xterm

EXPOSE 9000

#CMD ["php-fpm"]
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]