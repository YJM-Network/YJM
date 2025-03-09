#!/bin/bash


cat << "EOF"
+--------------------------------------------------------------------+
\|                     ,---.\_            \_\_\_\_                         |
\|                   .-- -.' \         ,'  , `.                       | |        ,---,      |    |   :     ,-+-,.' _ |                       | |       /_ ./|      :    ;   |  ,-+-. ;   , ||                       | | ,---, |  ' :      :        | ,--.'|'   |  ;|                       |
|/___/ \.  : |      |    :   :|   |  ,', |  ':                       | | .  \  \ ,' '      :         |   | /  | |  ||                       | |  \  ;  `  ,'      |    ;   |'   | :  | :  |,                       |
\|   \  \    '   \_\_\_ l         ;   . |  ; |--'                        |
\|    '  \   | /    /\    J   :|   : |  | ,                           |
\|     \  ;  ;/  ../  `..-    ,|   : '  |/                            | |      :  \  \    \         ; ;   | |`-'                             |
\|       \  ' ;\    \      ,'  |   ;/                                 |
\|        `--`  "---....--'    '---'                                  |
\|   ,---,                         \_\_\_                 ,--,    ,--,   |
|,`--.' |                       ,--.'|_             ,--.'|  ,--.'|   |
||   :  :      ,---,            |  | :,'            |  | :  |  | :   | |:   |  '  ,-+-. /  | .--.--.   :  : ' :            :  : '  :  : '   |
||   :  | ,--.'|'   |/  /    '.;__,'  /    ,--.--.  |  ' |  |  ' |   |
|'   '  ;|   |  ,"' |  :  /`./|  |   |    /       \ '  | |  '  | |   |
||   |  ||   | /  | |  :  ;\_  :\_\_,'| :   .--.  .-. ||  | :  |  | :   |
|'   :  ;|   | |  | |\  \    `. '  : |__  \__\/ : . .'  : |__'  : |__|
||   |  '|   | |  |/  `----.   |  | '.'| ," .--.; ||  | '.'|  | '.'||
|'   :  ||   | |--'  /  /`--'  /;  :    ;/  /  ,.  |;  :    ;  :    ;|
|;   |.' |   |/     '--'.     / |  ,   /;  :   .'   \  ,   /|  ,   / |
|'---'   '---'        `--'---'   ---`-' |  ,     .-./---`-'  ---`-'  | |                                        `--\`---'                    |
+--------------------------------------------------------------------+
EOF

# Funktion zur Auswahl der zu installierenden Pakete
echo "Wählen Sie die Software aus, die installiert werden soll:"
echo "1) Apache2"
echo "2) Samba"
echo "3) Ubuntu Desktop"
echo "4) MariaDB Server & Client"
echo "5) Docker & Docker-Compose"
echo "6) Alle installieren"
echo "7) Beenden"
read -p "Ihre Auswahl (Mehrfachauswahl mit Leerzeichen, z.B. 1 3 5): " choices

# System aktualisieren
echo "Aktualisiere Paketlisten..."
sudo apt update && sudo apt upgrade -y

# Installationen je nach Auswahl durchführen
for choice in $choices; do
    case $choice in
        1)
            echo "Installiere Apache2..."
            sudo apt install -y apache2
            ;;
        2)
            echo "Installiere Samba..."
            sudo apt install -y samba
            ;;
        3)
            echo "Installiere Ubuntu Desktop..."
            sudo apt install -y ubuntu-desktop
            ;;
        4)
            echo "Installiere MariaDB Server & Client..."
            sudo apt install -y mariadb-server mariadb-client
            ;;
        5)
            echo "Installiere Docker & Docker-Compose..."
            sudo apt install -y docker.io docker-compose
            sudo systemctl enable --now docker
            ;;
        6)
            echo "Installiere alle Pakete..."
            sudo apt install -y apache2 samba ubuntu-desktop mariadb-server mariadb-client docker.io docker-compose
            sudo systemctl enable --now docker
            break
            ;;
        7)
            echo "Installation abgebrochen."
            exit 0
            ;;
        *)
            echo "Ungültige Eingabe: $choice wird übersprungen."
            ;;
    esac
done

echo "Installation abgeschlossen!"
