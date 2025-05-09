FROM debian:stable-20250428-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    bash \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/nginx/sites-available/default
COPY ./conf/default.conf /etc/nginx/sites-available/default

COPY ./tools/setup_nginx.sh /setup_nginx.sh
RUN chmod +x /setup_nginx.sh

EXPOSE 443

ENTRYPOINT ["/setup_nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]