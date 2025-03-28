#!/bin/bash

# WARNUNG!
echo -e "\e[41mACHTUNG: Dieses Skript deinstalliert Apache und löscht alle zugehörigen Dateien!\e[0m"
echo "Falls du fortfahren möchtest, tippe 'JA' und drücke Enter."
read -r CONFIRMATION
if [ "$CONFIRMATION" != "JA" ]; then
  echo "Abgebrochen."
  exit 1
fi

# Apache deaktivieren und deinstallieren
sudo systemctl stop apache2
sudo systemctl disable apache2
sudo apt remove --purge -y apache2 apache2-utils apache2-bin apache2.2-common
sudo apt autoremove -y
sudo rm -rf /etc/apache2

# Eigenen Ordner für Proxy erstellen
mkdir -p /opt/nginx-proxy

# Variablen definieren
DOMAIN="example.com"
EMAIL="admin@example.com"

# Docker-Netzwerk für Reverse Proxy erstellen (falls nicht vorhanden)
docker network ls | grep -q nginx-proxy || docker network create nginx-proxy

# Nginx Proxy Manager Container starten
docker run -d \
  --name nginx-proxy-manager \
  --restart always \
  --network nginx-proxy \
  -p 80:80 -p 443:443 -p 81:81 \
  -v /opt/nginx-proxy/data:/data \
  -v /opt/nginx-proxy/letsencrypt:/etc/letsencrypt \
  jc21/nginx-proxy-manager

# Hinweis für den Benutzer
echo "Nginx Proxy Manager ist jetzt unter http://deine-domain:81 erreichbar."
echo "Standard-Login: admin@example.com / changeme"
