#!/bin/bash

yum install -y httpd mod_ssl
systemctl enable httpd.service
systemctl start httpd.service
/usr/sbin/apachectl start
systemctl disable firewalld
systemctl stop firewalld
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
service iptables save

yum install -y mariadb-server mariadb
systemctl enable mariadb.service

yum install -y php php-mysql php-gd php-pear php-pgsql
systemctl restart httpd.service
echo "
<?php
phpinfo(INFO_GENERAL);
?>" >> /var/www/html/test.php
cd /var/www/html/
yum install -y wget
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress/* .
chown -R apache:apache /var/www/html/

