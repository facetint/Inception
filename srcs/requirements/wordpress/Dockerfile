FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php php-mysql wget php-fpm php-curl curl netcat \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 
    
RUN mkdir -p /var/www/html /run/php && \
    chown -R www-data:www-data /var/www/html /run/php && \
    chmod -R 755 /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 9000

ENTRYPOINT ["/start.sh"]
