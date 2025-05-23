#!/usr/bin/env bash
set -euo pipefail

# Standard-Ports
DEFAULT_HTTP=8080
DEFAULT_HTTPS=8443

# Abfrage der Ports
read -p "Externer HTTP-Port [${DEFAULT_HTTP}]: " HTTP_PORT
HTTP_PORT=${HTTP_PORT:-$DEFAULT_HTTP}

read -p "Externer HTTPS-Port [${DEFAULT_HTTPS}]: " HTTPS_PORT
HTTPS_PORT=${HTTPS_PORT:-$DEFAULT_HTTPS}

# Zielordner anlegen
TARGET_DIR="apache-docker"
mkdir -p "${TARGET_DIR}"

# docker-compose.yml schreiben
cat > "${TARGET_DIR}/docker-compose.yml" <<EOF
version: '3.8'
services:
  apache:
    image: httpd:2.4
    ports:
      - "${HTTP_PORT}:80"
      - "${HTTPS_PORT}:443"
    restart: unless-stopped
EOF

echo "docker-compose.yml angelegt in ${TARGET_DIR}/docker-compose.yml"

# Apache-Image ziehen
echo "Ziehe Apache-Image..."
docker-compose -f "${TARGET_DIR}/docker-compose.yml" pull apache

echo "Fertig. Apache-Image ist lokal verfügbar."
