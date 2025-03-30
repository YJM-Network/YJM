#!/bin/bash

cat << "EOF"
+--------------------------------------------------------------------+
|                    Welcome to YJM Installer                        |
+--------------------------------------------------------------------+
EOF

echo "What do you want to install?"
echo "1. Server Install"
echo "2. Docker Images"
echo "3. Webmin"

read -p "Enter your choice (1-3): " choice

# Funktion zum Herunterladen und Ausführen eines Skripts
install_script() {
    local script_name=$1
    local script_path=$2
    local script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/insatller$script_path"

    echo "Downloading and executing $script_name..."
    if wget -q -O "$script_name" "$script_url"; then
        sudo chmod +x "$script_name"
        sudo dos2unix "$script_name"
        sudo ./$script_name
    else
        echo "Error: Failed to download $script_name. Please check your internet connection or the URL."
    fi
}

case "$choice" in
    1) install_script "server.sh" "server.sh" ;;
    2) install_script "docker.sh" "docker/docker.sh" ;;
    3) install_script "webmin.sh" "webmin.sh" ;;
    *) echo "Invalid choice. Please enter a number between 1 and 3." ;;
esac
