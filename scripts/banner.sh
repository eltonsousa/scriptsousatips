#!/bin/bash

sshd_config_bak=$(cat /etc/ssh/sshd_config | grep -v "Banner")
echo "$sshd_config_bak" > /etc/ssh/sshd_config
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
service ssh restart 1>/dev/null 2>/dev/null
service sshd restart 1>/dev/null 2>/dev/null
if [ -f /etc/bannerssh ]
then
banner=$(cat /etc/bannerssh)
else
banner="Não há um banner no momento"
fi
echo -e "\033[1;32mBanner atual\n\n\033[1;37m$banner\n\033[0m"
echo "Qual banner deseja adicionar (ctrl + c para sair )"
read -p ": " bannerssh
echo "$bannerssh" > /etc/bannerssh
service ssh restart 1> /dev/null 2>/dev/null
service sshd restart 1>/dev/null 2>/dev/null
