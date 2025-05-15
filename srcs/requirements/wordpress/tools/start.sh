#!/bin/sh
sleep 3

  export DB_PASSWORD=$(cat /run/secrets/db_password)
  export WP_ADMIN_PASS=$(sed -n '1p' /run/secrets/credentials)
  export WP_USER_PASSWORD=$(sed -n '2p' /run/secrets/credentials)

wait_for_mariadb() {
    while ! nc -z "${DB_HOST}" 3306; do
        echo "❌ MariaDB is not ready yet. Retrying in 2 seconds..."
        sleep 2
    done
    echo "✅ MariaDB is ready!"
}

setup_wordpress() {
    cd /var/www/html

    rm -rf /var/www/html/*

    wget -q http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* /var/www/html
    rm -rf latest.tar.gz wordpress

    echo "✅ WordPress downloaded and extracted."
}

install_wordpress() {
    if [ ! -f /var/www/html/wp-config.php ]; then
        echo "⚙️ Creating wp-config.php..."
        wp config create --allow-root \
            --dbname="${MYSQL_DATABASE_NAME}" \
            --dbuser="${MYSQL_USER}" \
            --dbpass="${DB_PASSWORD}" \
            --dbhost="mariadb"

        echo "🛠 Installing WordPress core..."
        wp core install --allow-root \
            --url="${DOMAIN_NAME}" \
            --title="${SITE_TITLE}" \
            --admin_user="${WP_ADMIN_USER}" \
            --admin_password="${WP_ADMIN_PASS}" \
            --admin_email="${WP_MAIL}"

        echo "👤 Creating additional user..."
        wp user create --allow-root \
            $WP_USER_NAME $WP_USER_EMAIL \
            --user_pass=$WP_USER_PASSWORD;

        echo "✅ WordPress installation complete."
    else
        echo "⚠️ wp-config.php already exists. Skipping setup."
    fi
}

set_permissions() {
    echo "🔐 Setting file permissions..."
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
    echo "✅ Permissions set."
}

main() {
    wait_for_mariadb
    setup_wordpress
    install_wordpress
    set_permissions
    echo "Starting PHP-FPM..."
    exec php-fpm7.4 --nodaemonize
}

main "$@"