#!/bin/bash

SSL_DIR="/etc/ssl"
SSL_CERT="${SSL_DIR}/ssl.crt"
SSL_KEY="${SSL_DIR}/ssl.key"
NGINX_CONF="/etc/nginx/sites-available/default"

mkdir -p ${SSL_DIR}

if [[ -f "${SSL_CERT}" && -f "${SSL_KEY}" ]]; then
    echo "SSL certificate and key already exist. Skipping creation."
else
    echo "🔐 Generating a self-signed SSL certificate for ${DOMAIN_NAME}..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout ${SSL_KEY} \
        -out ${SSL_CERT} \
        -subj "/CN=${CN}" 
    if [[ -f "${SSL_CERT}" && -f "${SSL_KEY}" ]]; then
        echo "SSL certificate and key successfully created for ${DOMAIN_NAME}."
    else
        echo "Failed to create SSL certificate or key!"
        exit 1
    fi
fi

if [[ -f "${NGINX_CONF}" ]]; then
    echo "Updating Nginx configuration with server_name ${DOMAIN_NAME}..."
    sed -i "s/DOMAIN_NAME/ ${DOMAIN_NAME}/" ${NGINX_CONF}
else
    echo "❌ Nginx configuration file not found: ${NGINX_CONF}"
    exit 1
fi

echo "🎉 SSL/TLS setup completed successfully for ${DOMAIN_NAME}!"

exec "$@"