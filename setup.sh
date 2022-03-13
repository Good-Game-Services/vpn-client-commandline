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


chmod +x /etc/vpn-client-commandline/main.js

cd /etc/vpn-client-commandline

npm install

echo "VPN Client successful installed!"