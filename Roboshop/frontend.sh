#!/bin/bash

ID=$(id -u)
COMPONENT= "frontend"
LOG="/tmp/${COMPONENT}.log"

if [ $ID -ne 0 ];then
    echo -e "\e[33m Login as Root user or type sudo command \e[0m"
    exit 1
fi

stat()
{
    if [ $1 -eq 0 ];then
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[31m Failure \e[0m"
        exit 2
    fi
} 

echo -n "Disabling nginx default package version: "
dnf module disable nginx -y > $LOG
stat $?

echo -n "Enabling nginx package version: "
dnf module enable nginx:1.24 -y >> $LOG
stat $?

echo -n "installing nginx package: "
dnf install nginx -y >> $LOG
stat $?
