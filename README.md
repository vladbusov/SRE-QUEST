### Делаем первоначальные настройки базы данныз;
> /usr/bin/mysql_secure_installation
### потом везде жмем «Y«:
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB </br>
SERVERS IN PRODUCTION USE! PLEASE READ EACH STEP CAREFULLY! </br>
In order to log into MariaDB to secure it, we'll need the current </br>
password for the root user. If you've just installed MariaDB, and </br>
you haven't set the root password yet, the password will be blank, </br>
so you should just press enter here. </br>
Enter current password for root (enter for none): просто нажать ENTER </br>
OK, successfully used password, moving on... </br>
Setting the root password ensures that nobody can log into the MariaDB </br>
root user without the proper authorisation. </br>
Set root password? [Y/n] Y </br>
New password: ввести ваш пароль </br>
Re-enter new password: ввести ваш пароль еще разочек </br>
Password updated successfully! </br>
Reloading privilege tables.. </br>
... Success! </br>
By default, a MariaDB installation has an anonymous user, allowing anyone </br>
to log into MariaDB without having to have a user account created for </br>
them. This is intended only for testing, and to make the installation </br>
go a bit smoother. You should remove them before moving into a </br>
production environment. </br>
Remove anonymous users? [Y/n] Y </br>
... Success! </br>
Normally, root should only be allowed to connect from 'localhost'. This </br>
ensures that someone cannot guess at the root password from the network. </br>
Disallow root login remotely? [Y/n] Y </br>
... Success! </br>
By default, MariaDB comes with a database named 'test' that anyone can </br>
access. This is also intended only for testing, and should be removed </br>
before moving into a production environment. </br>
Remove test database and access to it? [Y/n] Y </br>
- Dropping test database... </br>
... Success! </br>
- Removing privileges on test database... </br>
... Success! </br>
Reloading the privilege tables will ensure that all changes made so far </br>
will take effect immediately. </br>
Reload privilege tables now? [Y/n] Y </br>
... Success! </br>
Cleaning up... </br>
All done! If you've completed all of the above steps, your MariaDB </br>
installation should now be secure. </br>
Thanks for using MariaDB! </br>

### Создаем базу для WordPress:
### Входим в базу данных:
_____
> mysql -u root -p
### Придумываем имя для базы данных и создаем ее:
 > CREATE DATABASE wp1; </br>
### Создаем пользователя для этой базы данных:
 > CREATE USER wp@localhost; </br>
### Устанавливаем ему пароль:
 > SET PASSWORD FOR wp@localhost= PASSWORD("wp-password"); </br>
### Делаем этого пользователя хозяином новоиспеченной базы:
 > GRANT ALL PRIVILEGES ON wp1.* TO wp@localhost IDENTIFIED BY 'wp-password'; </br>
### Перезапускаем привилегии базы:
 > FLUSH PRIVILEGES; </br>
### Выходим из базы:
 > exit </br>
____
# Configure Network interfaces
Now, we should modify both(enp0s8 & enp0s9) configuration files as shown below. First, let us start from enp0s8. </br>
Edit file /etc/sysconfig/network-scripts/ifcfg-enp0s8, </br>
vi /etc/sysconfig/network-scripts/ifcfg-enp0s8 </br>
 </br>
Modify the file as shown below. </br>
> HWADDR="08:00:27:04:03:86" </br>
> TYPE="Ethernet" </br>
> BOOTPROTO="none" </br>
> DEFROUTE="yes" </br>
> PEERDNS="yes" </br>
> PEERROUTES="yes" </br>
> IPV4_FAILURE_FATAL="no" </br>
> IPV6INIT="yes" </br>
> IPV6_AUTOCONF="yes" </br>
> IPV6_DEFROUTE="yes" </br>
> IPV6_PEERDNS="yes" </br>
> IPV6_PEERROUTES="yes" </br>
> IPV6_FAILURE_FATAL="no" </br>
> NAME="enp0s8" </br>
> UUID="a97b23f2-fa87-49de-ac9b-39661ba9c20f" </br>
> ONBOOT="yes" </br>
> MASTER=bond0 </br>
> SLAVE=yes </br>
 </br>
## Then, Edit file /etc/sysconfig/network-scripts/ifcfg-enp0s9,
### vi /etc/sysconfig/network-scripts/ifcfg-enp0s9
### Modify the file as shown below.
> HWADDR=08:00:27:E7:ED:8E </br>
> TYPE=Ethernet </br>
> BOOTPROTO=none </br>
> DEFROUTE=yes </br>
> PEERDNS=yes </br>
> PEERROUTES=yes </br>
> IPV4_FAILURE_FATAL=no </br>
> IPV6INIT=yes </br>
> IPV6_AUTOCONF=yes </br>
> IPV6_DEFROUTE=yes </br>
> IPV6_PEERDNS=yes </br>
> IPV6_PEERROUTES=yes </br>
> IPV6_FAILURE_FATAL=no </br>
> NAME=enp0s9 </br>
> UUID=e2352c46-e1f9-41d2-98f5-af24b127b3e7 </br>
> ONBOOT=yes </br>
> MASTER=bond0 </br>
> SLAVE=yes </br>
#### Save and close the files.
