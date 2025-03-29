
#!/bin/bash






# Verzeichnis für Pi-hole erstellen
sudo mkdir -p ~/pihole && cd ~/pihole

# Docker-Compose Datei erstellen
echo "services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    ports:
      - \"5335:53/tcp\"
      - \"53:53/udp\"
      - \"8442:80/tcp\"
      - \"8442:443/tcp\"
    environment:
      TZ: 'Europe/London'
      FTLCONF_webserver_api_password: 'admin1222'
    volumes:
      - './etc-pihole:/etc/pihole'
    cap_add:
      - NET_ADMIN
    restart: unless-stopped" > docker-compose.yml

# Pi-hole Container starten
sudo docker-compose up -d

echo "Installation abgeschlossen."
