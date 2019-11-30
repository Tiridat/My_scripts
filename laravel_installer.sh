#!/bin/bash

# Installing Laravel PHP Framework on Ubuntu 16.04 for Apache

sudo apt-get update 
sudo apt-get upgrade

# Installing PHP 7.1

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.1 php7.1-mcrypt php7.1-xml php7.1-gd php7.1-opcache php7.1-mbstring

# Installing Apache

sudo apt-get install apache2 libapache2-mod-php7.1

# Installing Laravel

cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
cd /var/www/html
sudo composer create-project laravel/laravel your-project --prefer-dist

# Configuring Apache

sudo chgrp -R www-data /var/www/html/your-project
sudo chmod -R 775 /var/www/html/your-project/storage
cd /etc/apache2/sites-available
sudo nano laravel.conf

# <VirtualHost *:80>
#     ServerName yourdomain.tld
# 
#     ServerAdmin webmaster@localhost
#     DocumentRoot /var/www/html/your-project/public
# 
#     <Directory /var/www/html/your-project>
#         AllowOverride All
#     </Directory>
# 
#     ErrorLog ${APACHE_LOG_DIR}/error.log
#     CustomLog ${APACHE_LOG_DIR}/access.log combined
# </VirtualHost>

sudo a2dissite 000-default.conf
sudo a2ensite laravel.conf
sudo a2enmod rewrite
sudo service apache2 restart

# http://localhost
