FROM debian:stable-20250428-slim

RUN apt-get update && apt-get install -y \
    php php-mysql wget php-zip php-fpm php-curl curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 
    
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
