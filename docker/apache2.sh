#!/usr/bin/env bash
set -euo pipefail

# Voreinstellungen
DEFAULT_HTTP_PORT=8080
DEFAULT_HTTPS_PORT=8443
COMPOSE_FILE="docker-compose.yml"

echo
echo "=== Apache2 mit Docker-Compose einrichten ==="
echo

# Abfrage der externen Ports
read -p "Externer HTTP-Port [${DEFAULT_HTTP_PORT}]: " HTTP_PORT
HTTP_PORT=${HTTP_PORT:-$DEFAULT_HTTP_PORT}

read -p "Externer HTTPS-Port [${DEFAULT_HTTPS_PORT}]: " HTTPS_PORT
HTTPS_PORT=${HTTPS_PORT:-$DEFAULT_HTTPS_PORT}

echo
echo "Erstelle ${COMPOSE_FILE} mit folgenden Port-Mappings:"
echo "  HTTP  : ${HTTP_PORT} → 80"
echo "  HTTPS : ${HTTPS_PORT} → 443"
echo

# Generiere docker-compose.yml
cat > ${COMPOSE_FILE} <<EOF
version: '3.8'

services:
  apache:
    image: httpd:2.4
    container_name: apache2-docker
    ports:
      - "${HTTP_PORT}:80"
      - "${HTTPS_PORT}:443"
    volumes:
      - ./html:/usr/local/apache2/htdocs/      # optional: eigenes Webroot
    restart: unless-stopped
EOF

echo "Docker-Compose-Datei erzeugt."

# Erstelle Verzeichnis für Web-Inhalte, falls nicht vorhanden
mkdir -p html
echo "<h1>It works!</h1>" > html/index.html

# Docker Compose starten
echo
echo "Starte Apache2-Container..."
docker-compose up -d

echo
echo "Fertig! Apache2 läuft jetzt auf:"
echo "  http://localhost:${HTTP_PORT}"
echo "  https://localhost:${HTTPS_PORT}"
