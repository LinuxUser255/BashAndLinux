#!/usr/bin/env bash

#elif ladder
echo -e "Select scanning tool: \n1 = nmap\n2 = nikto\n3 = dirb\n4 = enum4linux\n5 = ldap\n6 = crackmapexec" 
read sel

#first if then
if [[ $sel -eq 1 ]]; 
then

./if01.sh  

#second if then
elif [[ $sel -eq 2 ]];
then

./if02.sh

#third if then
elif [[ $sel -eq 3 ]];
then

./if03.sh
 
elif [[ $sel -eq 4 ]];
then

#Enum4linux
echo "Enter target IP: "
read IP

enum4linux $IP

elif [[ $sel -eq 5 ]];
then

# LDAP SEARCH
echo "Enter IP: "
read IP

ldapsearch -h $IP  -x

elif [[ $sel -eq 6 ]];
then

# Crackmap Exec
echo "Enter IP: "
read $IP

crackmapexec smb $IP --shares -u '' -p ''


fi
