#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

rm -rf /var/www/html/*

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* /var/www/html
rm -rf latest.tar.gz
rm -rf wordpress


exec php-fpm8.2 --nodaemonize


exec "$@"