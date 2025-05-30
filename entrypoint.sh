#!/bin/sh

# Set variables
export LCL_LISTEN_PORT="${LISTEN_PORT:-80}"
export LCL_CONTAINER_NAME="${CONTAINER_NAME:-php-fpm}"
export LCL_CONTAINER_PORT="${CONTAINER_PORT:-9000}"
export LCL_DOCUMENT_ROOT="${DOCUMENT_ROOT:-/var/www/app}"

echo "Proxy details:"
echo "LISTEN_PORT: ${LCL_LISTEN_PORT}"
echo "DOCUMENT_ROOT: ${LCL_DOCUMENT_ROOT}"
echo "APP_CONTAINER: ${LCL_CONTAINER_NAME}"
echo "APP_PORT: ${LCL_CONTAINER_PORT}"
echo ""

# Prepare nginx.conf
envsubst '$LCL_LISTEN_PORT,$LCL_CONTAINER_NAME,$LCL_CONTAINER_PORT,$LCL_DOCUMENT_ROOT' < /etc/nginx/nginx.template > /etc/nginx/conf.d/default.conf

# Start nginx
nginx -g "daemon off;"