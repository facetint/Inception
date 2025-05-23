#!/bin/bash

export DB_PASSWORD=$(cat /run/secrets/db_password)
export DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

TEMP_PID=""

initialize_database() {
    echo "Initializing MariaDB data directory..."
    if [ -z "$(ls -A /var/lib/mysql)" ]; then
        echo "/var/lib/mysql is empty. Installing MariaDB system tables..."
        mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    else
        echo "✅ /var/lib/mysql already initialized. Skipping installation."
    fi
}

start_mariadb_temp() {
    echo "Starting MariaDB temporarily for configuration..."
    mariadbd --user=mysql --datadir=/var/lib/mysql &
    TEMP_PID=$!

    local i=0
    local timeout=30
    while ! mysqladmin ping -u root -p"${DB_ROOT_PASSWORD}" --silent; do
        if (( ++i > timeout )); then
            kill "$TEMP_PID"
            exit 1
        fi
        sleep 1
    done
}

generate_sql_config() {
    echo "🛠️ Generating SQL configuration..."
    mysql -u root -p"${DB_ROOT_PASSWORD}" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE_NAME}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
    echo "✅ SQL configuration completed."
}

restart_mariadb() {
    echo "Restarting MariaDB in foreground..."
    mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown
    wait "$TEMP_PID"
    exec mariadbd --user=mysql --datadir=/var/lib/mysql --port=3306 --console
}

main() {
    initialize_database
    start_mariadb_temp
    generate_sql_config
    restart_mariadb
    echo "MariaDB setup completed."
}

main "$@"