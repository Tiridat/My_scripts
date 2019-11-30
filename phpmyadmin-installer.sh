#!/bin/bash
# https://www.digitalocean.com/community/tutorials/linux-apache-mysql-php-lamp-ubuntu-16-04-ru
# https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-12-04
# Шаг 1 - Установка Apache и настройка файрвола

sudo apt-get update
sudo apt-get install apache2
sudo apache2ctl configtest

# AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message

# Syntax OK
sudo vim / etc/apache2/apache2.conf
# ServerName localhost
sudo apache2ctl configtest

# Syntax OK
sudo systemctl restart apache2
sudo ufw app list

#Available applications:
#  Apache
#  Apache Full
#  Apache Secure
#  OpenSSH

sudo ufw app info"Apache Full"

# Profile: Apache Full
# Title: Web Server (HTTP,HTTPS)
# Description: Apache v2 is the next generation of the omnipresent Apache web
# server.
#
# Ports:
#  80,443/tcp

sudo ufw allow in "Apache Full"
# open http://localhost

# ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
# sudo apt-get install curl
# curl http://icanhazip.com

# Шаг 2 - Установка MySQL


sudo apt-get install mysql-server
sudo mysql_secure_installation
# VALIDATE PASSWORD PLUGIN can be used to test passwords
# and improve security. It checks the strength of password
# and allows the users to set only those passwords which are
# secure enough. Would you like to setup VALIDATE PASSWORD plugin?
# Press y|Y for Yes, any other key for No:

# Шаг 3 - Установка PHP

sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql

sudo vim /etc/apache2/mods-enabled/dir.conf
# <IfModule mod_dir.c>
#     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
# </IfModule>



sudo systemctl restart apache2
sudo systemctl status apache2


sudo apt-get install php-cli


# Шаг 4 - Тестирование работы PHP на вашем веб-сервере

sudo vim /var/www/html/info.php

# <?php
# phpinfo();
# ?>

# open http://localhost/info.php

# Шаг 5.Install phpMyAdmin

sudo apt-get install phpmyadmin apache2-utils

sudo vim /etc/apache2/apache2.conf
# Include /etc/phpmyadmin/apache.conf


sudo service apache2 restart
sudo vim /etc/phpmyadmin/apache.conf 
# <Directory /usr/share/phpmyadmin>
#        Options FollowSymLinks
#        DirectoryIndex index.php
#        AllowOverride All
#        [...]



sudo vim /usr/share/phpmyadmin/.htaccess

# AuthType Basic
# AuthName "Restricted Files"
# AuthUserFile /etc/apache2/.phpmyadmin.htpasswd
# Require valid-user

sudo htpasswd -c /etc/apache2/.phpmyadmin.htpasswd Home

sudo service apache2 restart


