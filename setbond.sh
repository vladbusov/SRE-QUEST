#!/bin/bash

modprobe --first-time bonding

echo '
NAME=bond0
DEVICE=bond0
BONDING_MASTER=yes
TYPE=Bond
IPADDR=192.148.168.\$1
NETMASK=255.255.255.255
GATEWAY=192.168.142.1
DNS1=192.168.142.1
ONBOOT=yes
BOOTPROTO=yes
BONDING_OPTS="mode=active-backup miimon=100"
NM_CONTROLLED=no
ZONE=public
' > /etc/sysconfig/network-scripts/ifcfg-bond0

