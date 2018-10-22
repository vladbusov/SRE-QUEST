Делаем первоначальные настройки базы данныз;
# /usr/bin/mysql_secure_installation
потом везде жмем «Y«:
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
SERVERS IN PRODUCTION USE! PLEASE READ EACH STEP CAREFULLY!
In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.
Enter current password for root (enter for none): просто нажать ENTER
OK, successfully used password, moving on...
Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.
Set root password? [Y/n] Y
New password: ввести ваш пароль
Re-enter new password: ввести ваш пароль еще разочек
Password updated successfully!
Reloading privilege tables..
... Success!
By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them. This is intended only for testing, and to make the installation
go a bit smoother. You should remove them before moving into a
production environment.
Remove anonymous users? [Y/n] Y
... Success!
Normally, root should only be allowed to connect from 'localhost'. This
ensures that someone cannot guess at the root password from the network.
Disallow root login remotely? [Y/n] Y
... Success!
By default, MariaDB comes with a database named 'test' that anyone can
access. This is also intended only for testing, and should be removed
before moving into a production environment.
Remove test database and access to it? [Y/n] Y
- Dropping test database...
... Success!
- Removing privileges on test database...
... Success!
Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.
Reload privilege tables now? [Y/n] Y
... Success!
Cleaning up...
All done! If you've completed all of the above steps, your MariaDB
installation should now be secure.
Thanks for using MariaDB!

Создаем базу для WordPress:
Входим в базу данных:
# mysql -u root -p
Придумываем имя для базы данных и создаем ее:
> CREATE DATABASE wp1;
Создаем пользователя для этой базы данных:
> CREATE USER wp@localhost;
Устанавливаем ему пароль:
> SET PASSWORD FOR wp@localhost= PASSWORD("wp-password");
Делаем этого пользователя хозяином новоиспеченной базы:
> GRANT ALL PRIVILEGES ON wp1.* TO wp@localhost IDENTIFIED BY 'wp-password';
Перезапускаем привилегии базы:
> FLUSH PRIVILEGES;
Выходим из базы:
> exit
_____
# Configure Network interfaces
Now, we should modify both(enp0s8 & enp0s9) configuration files as shown below. First, let us start from enp0s8.
Edit file /etc/sysconfig/network-scripts/ifcfg-enp0s8,
vi /etc/sysconfig/network-scripts/ifcfg-enp0s8

Modify the file as shown below.
> HWADDR="08:00:27:04:03:86"
> TYPE="Ethernet"
> BOOTPROTO="none"
> DEFROUTE="yes"
> PEERDNS="yes"
> PEERROUTES="yes"
> IPV4_FAILURE_FATAL="no"
> IPV6INIT="yes"
> IPV6_AUTOCONF="yes"
> IPV6_DEFROUTE="yes"
> IPV6_PEERDNS="yes"
> IPV6_PEERROUTES="yes"
> IPV6_FAILURE_FATAL="no"
> NAME="enp0s8"
> UUID="a97b23f2-fa87-49de-ac9b-39661ba9c20f"
> ONBOOT="yes"
> MASTER=bond0
> SLAVE=yes

## Then, Edit file /etc/sysconfig/network-scripts/ifcfg-enp0s9,
### vi /etc/sysconfig/network-scripts/ifcfg-enp0s9
### Modify the file as shown below.
> HWADDR=08:00:27:E7:ED:8E
> TYPE=Ethernet
> BOOTPROTO=none
> DEFROUTE=yes
> PEERDNS=yes
> PEERROUTES=yes
> IPV4_FAILURE_FATAL=no
> IPV6INIT=yes
> IPV6_AUTOCONF=yes
> IPV6_DEFROUTE=yes
> IPV6_PEERDNS=yes
> IPV6_PEERROUTES=yes
> IPV6_FAILURE_FATAL=no
> NAME=enp0s9
> UUID=e2352c46-e1f9-41d2-98f5-af24b127b3e7
> ONBOOT=yes
> MASTER=bond0
> SLAVE=yes
#### Save and close the files.
