#!/bin/bash

setup_wordpress() {
    cd /var/www/html

    rm -rf /var/www/html/*

    wget -q http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* /var/www/html
    rm -rf latest.tar.gz wordpress

    echo "✅ WordPress downloaded and extracted."
}

configure_wp_config() {

    if [ -f /var/www/html/wp-config.php ]; then
        echo "⚠️ wp-config.php already exists. Skipping configuration."
        return
    fi

    wp config create --allow-root \
        --dbname="${DB_NAME}" \
        --dbuser="${DB_USER}" \
        --dbpass="${DB_PASS}" \
        --dbhost="mariadb"

    echo "✅ wp-config.php configured."
}

install_wordpress() {
    wp core install --allow-root \
        --url="${SERVER_NAME}" \
        --title="${SITE_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_MAIL}"

     wp user create --allow-root \
        $WP_USER_NAME $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASSWORD;
    echo "✅ WordPress installed successfully."
}

main() {
    setup_wordpress
    configure_wp_config
    install_wordpress
    exec php-fpm7.4 --nodaemonize
}

main "$@"