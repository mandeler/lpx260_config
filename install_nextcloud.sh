#!/bin/bash
sudo  wget https://download.nextcloud.com/server/releases/nextcloud-11.0.1.zip
sudo apt install apache2 mariadb-server php php-mysql php-*  -y
sudo a2enmod php
#后续将nextcloud解压拷贝到apache目录，新增sites-available，a2ensite，接着启动mysql/apache2,新建db和用户；
