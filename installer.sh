#!/bin/bash

cat << "EOF"
+--------------------------------------------------------------------+
|                     ,---._            ____                         |
|                   .-- -.' \         ,'  , `.                       |
|        ,---,      |    |   :     ,-+-,.' _ |                       |
|       /_ ./|      :    ;   |  ,-+-. ;   , ||                       |
| ,---, |  ' :      :        | ,--.'|'   |  ;|                       |
|/___/ \.  : |      |    :   :|   |  ,', |  ':                       |
| .  \  \ ,' '      :         |   | /  | |  ||                       |
|  \  ;  `  ,'      |    ;   |'   | :  | :  |,                       |
|   \  \    '   ___ l         ;   . |  ; |--'                        |
|    '  \   | /    /\    J   :|   : |  | ,                           |
|     \  ;  ;/  ../  `..-    ,|   : '  |/                            |
|      :  \  \    \         ; ;   | |`-'                             |
|       \  ' ;\    \      ,'  |   ;/                                 |
|        `--`  "---....--'    '---'                                  |
|   ,---,                         ___                 ,--,    ,--,   |
|,`--.' |                       ,--.'|_             ,--.'|  ,--.'|   |
||   :  :      ,---,            |  | :,'            |  | :  |  | :   |
|:   |  '  ,-+-. /  | .--.--.   :  : ' :            :  : '  :  : '   |
||   :  | ,--.'|'   |/  /    '.;__,'  /    ,--.--.  |  ' |  |  ' |   |
|'   '  ;|   |  ,"' |  :  /`./|  |   |    /       \ '  | |  '  | |   |
||   |  ||   | /  | |  :  ;_  :__,'| :   .--.  .-. ||  | :  |  | :   |
|'   :  ;|   | |  | |\  \    `. '  : |__  \__\/ : . .'  : |__'  : |__|
||   |  '|   | |  |/  `----.   \|  | '.'| ," .--.; ||  | '.'|  | '.'|| 
|'   :  ||   | |--'  /  /`--'  /;  :    ;/  /  ,.  |;  :    ;  :    ;|
|;   |.' |   |/     '--'.     / |  ,   /;  :   .'   \  ,   /|  ,   / |
|'---'   '---'        `--'---'   ---`-' |  ,     .-./---`-'  ---`-'  |
|                                        `--`---'                    |
+--------------------------------------------------------------------+
EOF

echo "What do you want to install?"
echo "1. Server Install"
echo "2. Rocket Chat install"
echo "3. Reverse Proxy install"
echo "4. Nextcloud install"
echo "5. Virtuell Box"
echo "6. Isos"
echo "7. Webmin"

read -p "Enter your choice (1-7): " choice

if [ "$choice" -eq 1 ]; then
    echo "Downloading and executing the server install script..."
    wget -O server.sh http://source.yjmhub.net/server.sh
    sudo chmod +x server.sh
    sudo dos2unix server.sh
    sudo ./server.sh
fi


if [ "$choice" -eq 2 ]; then
    echo "Downloading and executing the Rocket-Chat script..."
    wget -O r.sh http://source.yjmhub.net/r.sh
    sudo chmod +x r.sh
    sudo dos2unix r.sh
    sudo ./r.sh
fi

if [ "$choice" -eq 3 ]; then
    echo "Downloading and executing the Proxy install script..."
    wget -O proxy.sh http://source.yjmhub.net/proxy.sh
    sudo chmod +x proxy.sh
    sudo dos2unix proxy.sh
    sudo ./proxy.sh
fi

if [ "$choice" -eq 4 ]; then
    echo "Downloading and executing the Nextcloud script..."
    wget -O cloud.sh http://source.yjmhub.net/cloud.sh
    sudo chmod +x cloud.sh
    sudo dos2unix cloud.sh
    sudo ./cloud.sh
fi


if [ "$choice" -eq 5 ]; then
    echo "Downloading and executing the Rocket-Chat script..."
    wget -O vm.sh http://source.yjmhub.net/vm.sh
    sudo chmod +x vm.sh
    sudo dos2unix vm.sh
    sudo ./vm.sh
fi

if [ "$choice" -eq 6 ]; then
    echo "Downloading and executing the Rocket-Chat script..."
    wget -O iso.sh http://source.yjmhub.net/iso.sh
    sudo chmod +x iso.sh
    sudo dos2unix iso.sh
    sudo ./iso.sh
fi

if [ "$choice" -eq 7 ]; then
    echo "Downloading and executing the Webmin script..."
    wget -O webmin.sh http://source.yjmhub.net/webmin.sh
    sudo chmod +x webmin.sh
    sudo dos2unix webmin.sh
    sudo ./webmin.sh
fi




