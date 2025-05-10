FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    bash \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/nginx/sites-enabled/default
COPY ./conf/default.conf /etc/nginx/sites-enabled/default

COPY ./tools/setup_nginx.sh /setup_nginx.sh
RUN chmod +x /setup_nginx.sh

EXPOSE 443

ENTRYPOINT ["/setup_nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]