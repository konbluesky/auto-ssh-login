#!/usr/bin/bash

if [ $# -le 1 ]
then
     echo "Give me Username and Password... otherwise ***off"
     exit 1
fi

IPADDR=$1

echo "Type password for '$2'" 
read -s -p "Password:"  passwd

username=`id -u -n`
passwdfile="/home/$username/.ssh/remotehosts"

passwd_encode=`echo $passwd | base64`

echo $1:$2:$passwd_encode >> $passwdfile


