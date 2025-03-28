#!/bin/bash

sudo mkdir -p ~/nextcloud && cd ~/nextcloud
# Docker-Compose Datei für Nextcloud erstellen
echo "services:
  nextcloud:
    image: lscr.io/linuxserver/nextcloud:latest
    container_name: nextcloud
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /path/to/nextcloud/config:/config
      - /path/to/data:/data
    ports:
      - 7443:443
    restart: unless-stopped" > docker-compose.yml

# Nextcloud Container starten
sudo docker-compose up -d

echo "Nextcloud Installation abgeschlossen. Nextcloud ist auf Port 7443 erreichabr "


e
