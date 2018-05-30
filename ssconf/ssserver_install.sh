#!/bin/bash
# update system repo and uprade 
sudo apt-get update 
# insall python-pip and shadowsocks then uprade ssserver in order to support aes-256-gcm
sudo apt-get install python-pip 
sudo pip install --upgrade pip 
sudo pip install setuptools
sudo pip install shadowsocks
sudo pip install --upgrade git+https://github.com/shadowsocks/shadowsocks.git@master
# copy config files into /etc
sudo cp ssserver.json  /etc/
sudo cp rc.local /etc/
ssserver -d start -c /etc/ssserver.json
