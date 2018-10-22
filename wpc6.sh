#!/bin/bash

yum install -y httpd
chkconfig httpd on
service httpd start
iptables -I INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
service iptables save
/etc/init.d/iptables restart
yum install -y mysql mysql-server
chkconfig mysqld on
service mysqld start
mysqladmin -u root password '123456'
yum install -y php php-mysql php-gd php-pear php-pgsql
yum -y install automake php-devel libtool openssl-devel gcc php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlprc gcc php-devel php-pear php-common php-mbstring
service httpd restart
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

