#!/bin/bash

apt install -y apache2 apache2-utils
systemctl enable apache2
systemctl start apache2
iptables -I INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
iptables -I INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT
service iptables save

apt install -y mysql-client mysql-server
apt install -y php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd
echo "<?php
phpinfo();
?>" >> /var/www/html/info.php
systemctl enable mysql
cd /tmp
wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo rsync -av wordpress/* /var/www/html/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
systemctl restart mysql.service
systemctl restart apache2.service
rm /var/www/html/index.php
apt install php libapache2-mod-php php-mysql
systemctl restart apache2

