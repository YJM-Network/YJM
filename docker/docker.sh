
#!/bin/bash

cat << "EOF"
+--------------------------------------------------------------------+
|                    Welcome to YJM Docker Installer                 |
+--------------------------------------------------------------------+
EOF

echo "What Docker image would you like to install?"
echo "1. Install Docker and Docker Compose"
echo "2. Rocket.Chat"
echo "3. Pi-hole"
echo "4. Proxy (Nginx)"
echo "5. Portainer"
echo "6. Nextcloud"
echo "7. Apache2"

read -p "Enter your choice (1-7): " docker_choice

# Funktion zur Überprüfung, ob ein Befehl existiert
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Docker und Docker Compose installieren
install_docker() {
    echo "Checking if Docker is installed..."
    
    if ! command_exists docker; then
        echo "Docker is not installed. Installing Docker..."
        curl -fsSL https://get.docker.com | sudo sh
        sudo systemctl start docker
        sudo systemctl enable docker
        echo "Docker installation completed."
    else
        echo "Docker is already installed."
    fi

    echo "Checking if Docker Compose is installed..."
    
    if ! command_exists docker-compose; then
        echo "Docker Compose is not installed. Installing Docker Compose..."
        sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        echo "Docker Compose installation completed."
    else
        echo "Docker Compose is already installed."
    fi
}

# Funktion zum Herunterladen, Ausführen und Umwandeln der Skripte
install_docker_image() {
    case "$1" in
        1)
            install_docker
            ;;
        2)
            echo "Downloading and executing Rocket.Chat script..."
            script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/docker/rocket_chat.sh"
            wget -q -O rocket_chat.sh "$script_url"
            sudo chmod +x rocket_chat.sh
            sudo dos2unix rocket_chat.sh
            sudo ./rocket_chat.sh
            echo "Rocket.Chat installation completed."
            ;;
        3)
            echo "Downloading and executing Pi-hole script..."
            script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/docker/pihole.sh"
            wget -q -O pihole.sh "$script_url"
            sudo chmod +x pihole.sh
            sudo dos2unix pihole.sh
            sudo ./pihole.sh
            echo "Pi-hole installation completed."
            ;;
        4)
            echo "Downloading and executing Proxy script..."
            script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/docker/proxy.sh"
            wget -q -O proxy.sh "$script_url"
            sudo chmod +x proxy.sh
            sudo dos2unix proxy.sh
            sudo ./proxy.sh
            echo "Proxy installation completed."
            ;;
        5)
            echo "Downloading and executing Portainer script..."
            script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/docker/portainer.sh"
            wget -q -O portainer.sh "$script_url"
            sudo chmod +x portainer.sh
            sudo dos2unix portainer.sh
            sudo ./portainer.sh
            echo "Portainer installation completed."
            ;;
        6)
            echo "Downloading and executing Nextcloud script..."
            script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/docker/cloud.sh"
            wget -q -O cloud.sh "$script_url"
            sudo chmod +x cloud.sh
            sudo dos2unix cloud.sh
            sudo ./cloud.sh
            echo "Nextcloud installation completed."
            ;;

        7) 
           echo "Downlaoding Apache2 skript"
           skript_url="https://raw.githubusercontent.com/YJM-Network/YJM/refs/heads/main/docker/apache2.sh" 
           wget -q -O apache2.sh "$srkipt_url"
           sudo chmod +x apache2.sh
           sudo dos2unix apache2.sh
           sudo ./apache2.sh
           echo "Apache2 Installiert"
           ;;

        
        *)
            echo "Invalid choice. Please enter a number between 1 and 7."
            ;;
    esac
}

install_docker_image $docker_choice
