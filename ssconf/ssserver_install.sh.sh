#!/bin/bash
# update system repo and uprade 
sudo apt-get update && sudo apt-get upgrade -y
# insall python-pip and shadowsocks then uprade ssserver in order to support aes-256-gcm
sudo apt-get install python-pip -y
sudo pip install --upgrade pip -y
sudo pip install shadowsocks
sudo pip install --upgrade git+https://github.com/shadowsocks/shadowsocks.git@master
# copy config files into /etc
sudo cp ssserver.json  /etc/
sudo cp rc.local /etc/
sudo systemctl start ufw && sudo systemctl enable ufw 
sudo ufw allow 22
sudo ufw allow 56243
sudo ufw allow 5903
sudo ufw allow
sudo ufw enable