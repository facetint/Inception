FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php php-mysql wget php-fpm php-curl curl netcat 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 
    
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 9000

ENTRYPOINT ["/start.sh"]
