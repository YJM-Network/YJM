#!/bin/bash

# Überprüfen, ob das Skript als Root ausgeführt wird
if [[ $EUID -ne 0 ]]; then
   echo "Dieses Skript muss als Root ausgeführt werden!" 
   exit 1
fi

# Webmin-Setup-Skript herunterladen
sudo curl -o webmin-setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repos.sh

# Setup-Skript ausführen
sudo sh webmin-setup-repos.sh

# Webmin installieren
sudo apt-get update
sudo apt-get install webmin --install-recommends -y

echo "Webmin-Installation abgeschlossen!"
