#!/bin/bash

initialize_database() {
    rm -rf /var/lib/mysql/*
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
}

start_mariadb() {
    echo "Starting MariaDB in the background"
    mariadbd --user=mysql --datadir=/var/lib/mysql &
    sleep 5
}

generate_sql_config() {
    echo "⚙️ Generating SQL configuration..."
    cat << EOF > /tmp/sqlConfig.sql
    CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
    GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
    CREATE USER IF NOT EXISTS '${DB_ADMIN_USER}'@'%' IDENTIFIED BY '${DB_ADMIN_PASS}';
    GRANT ALL PRIVILEGES ON *.* TO '${DB_ADMIN_USER}'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF
}

apply_sql_config() {
    echo "Applying SQL configuration..."
    mysql < /tmp/sqlConfig.sql
    echo "SQL configuration applied successfully."
}

restart_mariadb() {
    echo "Restarting MariaDB..."
    mariadb -e "SHUTDOWN;"
    sleep 2
    exec mariadbd --user=mysql --datadir=/var/lib/mysql --port=3306 --console
}

main() {
    initialize_database
    start_mariadb
    generate_sql_config
    apply_sql_config
    restart_mariadb
}

main "$@"