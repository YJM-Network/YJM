#!/bin/bash

cat << "EOF"
+--------------------------------------------------------------------+
|                    Welcome to YJM Installer                        |
+--------------------------------------------------------------------+
EOF

echo "What do you want to install?"
echo "1. Server Install"
echo "2. Rocket Chat install"
echo "3. Reverse Proxy install"
echo "4. Nextcloud install"
echo "5. VirtualBox"
echo "6. ISOs"
echo "7. Webmin"

read -p "Enter your choice (1-7): " choice

# Funktion zum Herunterladen und Ausführen eines Skripts
install_script() {
    local script_name=$1
    local script_url="https://raw.githubusercontent.com/YJM-Network/YJM/main/$script_name"

    echo "Downloading and executing $script_name..."
    if wget -q -O "$script_name" "$script_url"; then
        sudo chmod +x "$script_name"
        sudo dos2unix "$script_name"
        sudo ./"$script_name"
    else
        echo "Error: Failed to download $script_name. Please check your internet connection or the URL."
    fi
}

case "$choice" in
    1) install_script "server.sh" ;;
    2) install_script "r.sh" ;;
    3) install_script "proxy.sh" ;;
    4) install_script "cloud.sh" ;;
    5) install_script "vm.sh" ;;
    6) install_script "iso.sh" ;;
    7) install_script "webmin.sh" ;;
    *) echo "Invalid choice. Please enter a number between 1 and 7." ;;
esac
