#!/bin/bash

# Setze die Variable für den VirtualBox-Download-Link
VBOX_URL="https://download.virtualbox.org/virtualbox/7.1.6/virtualbox-7.1_7.1.6-167084~Ubuntu~oracular_amd64.deb"
VBOX_DEB="virtualbox-7.1_7.1.6-167084~Ubuntu~oracular_amd64.deb"

# Aktualisiere Paketlisten
echo "Aktualisiere Paketlisten..."
sudo apt update -y

# Installiere Abhängigkeiten
echo "Installiere benötigte Pakete..."
sudo apt install -y wget curl gnupg2 software-properties-common dkms

# Lade die VirtualBox .deb-Datei herunter
echo "Lade VirtualBox herunter..."
wget -O "$VBOX_DEB" "$VBOX_URL"

# Installiere VirtualBox
echo "Installiere VirtualBox..."
sudo dpkg -i "$VBOX_DEB"

# Fehlt Abhängigkeiten? Falls ja, beheben
echo "Behebe fehlende Abhängigkeiten..."
sudo apt-get install -f -y

# Prüfe die Installation
echo "Prüfe VirtualBox-Version..."
vboxmanage --version

echo "VirtualBox wurde erfolgreich installiert!"
