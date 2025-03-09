#!/bin/bash

# Setze Variablen
NEXTCLOUD_DIR="$HOME/nextcloud-docker"
DOMAIN="localhost"
DB_ROOT_PASSWORD="rootpass"
DB_NAME="nextcloud"
DB_USER="nextcloud"
DB_PASSWORD="data991"

# Stelle sicher, dass Docker und Docker Compose installiert sind
if ! command -v docker &> /dev/null; then
    echo "Docker ist nicht installiert. Bitte installiere Docker."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose ist nicht installiert. Bitte installiere Docker Compose."
    exit 1
fi

# Erstelle das Verzeichnis
mkdir -p "$NEXTCLOUD_DIR"
cd "$NEXTCLOUD_DIR" || exit

# Erstelle die Docker-Compose-Datei
cat > docker-compose.yml <<EOF
version: '3.8'
services:
  db:
    image: mariadb:10.5
    container_name: nextcloud-db
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: $DB_ROOT_PASSWORD
      MYSQL_DATABASE: $DB_NAME
      MYSQL_USER: $DB_USER
      MYSQL_PASSWORD: $DB_PASSWORD
    volumes:
      - db_data:/var/lib/mysql
  
  redis:
    image: redis:alpine
    container_name: nextcloud-redis
    restart: always
    command: redis-server --appendonly yes
    volumes:
      - redis_data:/data
  
  app:
    image: nextcloud:latest
    container_name: nextcloud-app
    restart: always
    ports:
      - "8080:80"
    environment:
      NEXTCLOUD_TRUSTED_DOMAINS: $DOMAIN
      MYSQL_HOST: db
      MYSQL_DATABASE: $DB_NAME
      MYSQL_USER: $DB_USER
      MYSQL_PASSWORD: $DB_PASSWORD
      REDIS_HOST: redis
    volumes:
      - nextcloud_data:/var/www/html
    depends_on:
      - db
      - redis

volumes:
  db_data:
  redis_data:
  nextcloud_data:
EOF

# Starte die Container
docker-compose up -d

echo "Nextcloud wurde erfolgreich installiert. Rufe http://localhost:8080 auf, um die Einrichtung abzuschließen."
