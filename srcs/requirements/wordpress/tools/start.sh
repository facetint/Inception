#!/bin/bash

setup_wordpress() {
    mkdir -p /var/www/html
    cd /var/www/html

    rm -rf /var/www/html/*

    echo "Downloading WordPress..."

    wget -q http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* /var/www/html
    rm -rf latest.tar.gz wordpress

    echo "✅ WordPress downloaded and extracted."
}

configure_wp_config() {
    echo "⚙️ Configuring wp-config.php..."
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    sed -i "s/define( *'DB_NAME'.*/define('DB_NAME', '${DB_NAME}');/" /var/www/html/wp-config.php
    sed -i "s/define( *'DB_USER'.*/define('DB_USER', '${DB_USER}');/" /var/www/html/wp-config.php
    sed -i "s/define( *'DB_PASSWORD'.*/define('DB_PASSWORD', '${DB_PASS}');/" /var/www/html/wp-config.php
    sed -i "s/define( *'DB_HOST'.*/define('DB_HOST', 'mariadb');/" /var/www/html/wp-config.php

    echo "wp-config.php configured."
}

set_permissions() {
    echo "🔒 Setting permissions for /var/www/html..."
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
}

install_wordpress() {
    echo "Installing WordPress..."
    wp core install \
        --url="https://${SERVER_NAME}" \
        --title="${SITE_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_MAIL}" \
        --allow-root
    echo "WordPress installed successfully."
}

start_php_fpm() {
    echo "Starting PHP-FPM..."
    exec php-fpm8.2 --nodaemonize
}

main() {
    echo "Starting WordPress setup"
    setup_wordpress
    configure_wp_config
    set_permissions
    install_wordpress
    start_php_fpm
}

main "$@"