#!/bin/bash
#login to your vps without private key..

wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/Haris131/autoscriptvps/main/sshd_config
systemctl restart sshd
clear

sed -i 's@#PermitRootLogin[[:space:]]prohibit-password@PermitRootLogin yes@g' /etc/ssh/sshd_config

sed -i 's@#PubkeyAuthentication[[:space:]]yes@PubkeyAuthentication no@g' /etc/ssh/sshd_config

sed -i 's@PasswordAuthentication[[:space:]]no@PasswordAuthentication yes@g' /etc/ssh/sshd_config

service ssh restart
passwd root
rm vpsroot.sh