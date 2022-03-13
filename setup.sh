#!/bin/bash
#
# https://github.com/Good-Game-Services/vpn-client-commandline
#
# Copyright (c) 2022 GGS-Network. Released under the Apache2 License.

apt update

apt upgrade -y

apt install curl git openvpn -y

curl -sL https://deb.nodesource.com/setup_16.x | bash -

apt install nodejs gcc g++ make -y

cd /etc/

git clone https://github.com/Good-Game-Services/vpn-client-commandline


{
	echo "[Unit]
    Description=VPN Client by GGS-Network

    [Service]
    ExecStart=node /etc/vpn-client-commandline/main.js
    Restart=always
    User=nobody
    # Note Debian/Ubuntu uses 'nogroup', RHEL/Fedora uses 'nobody'
    Group=nogroup
    Environment=PATH=/usr/bin:/usr/local/bin
    Environment=NODE_ENV=production
    WorkingDirectory=/etc/vpn-client-commandline

    [Install]
    WantedBy=multi-user.target"
} > /etc/systemd/system/VPN-Client.services

chmod +x /etc/vpn-client-commandline/main.js

cd /etc/vpn-client-commandline

npm install

echo "VPN Client successful installed!"

npm start