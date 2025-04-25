FROM debian:bullseye-slim


RUN apt-get update && apt-get install -y nginx bash && rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/nginx/sites-available/default
COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
