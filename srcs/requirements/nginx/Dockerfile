FROM debian:stable-20250428-slim


RUN apt-get update && apt-get install -y nginx bash && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/nginx/sites-available/default
COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
