#!/bin/bash

# Erstelle ein Verzeichnis für Rocket.Chat
sudo mkdir -p ~/docker/rocketchat && cd ~/docker/rocketchat

# Erstelle eine docker-compose.yml Datei
sudo cat <<EOF > docker-compose.yml
version: '3'

services:
  rocketchat:
    image: rocketchat/rocket.chat:latest
    container_name: rocketchat
    restart: always
    ports:
      - "3000:3000"
    environment:
      - MONGO_URL=mongodb://mongo:27017/rocketchat
      - ROOT_URL=http://localhost:3000
    depends_on:
      - mongo

  mongo:
    image: mongo:latest
    container_name: mongo
    restart: always
    volumes:
      - mongo-data:/data/db

volumes:
  mongo-data:
EOF

# Starte die Container
sudo docker-compose up -d

echo "Rocket.Chat wurde erfolgreich eingerichtet!"
