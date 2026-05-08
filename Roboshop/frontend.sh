#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ];then
    echo -e "\e[32m You should run the script as a root \e[0m"
else
    echo -e "\e[33m Welcome to the script \e[0m"
fi

stat(){
    if [ $1 -eq 0 ];then
        echo -e "\e[32m Success \e[0m"
    else    
        echo -e "\e[31m Failure \e[0m"
}


echo -n "Disabling the nginx repo"
dnf module disable nginx -y
stat $?

echo -n "Enabling nginx:1.24 repo"
dnf module enable nginx:1.24 -y
stat $?

echo -n "installing nginx"
dnf install nginx -y
stat $?