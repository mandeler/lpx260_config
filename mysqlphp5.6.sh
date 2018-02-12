#!/bin/bash
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php5.6 libapache2-mod-php5.6 
sudo apt-get install -y mysql-server  php5.6-mssql
