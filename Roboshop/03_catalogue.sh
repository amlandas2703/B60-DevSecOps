#!/bin/bash

ID=$(id -u)
COMPONENT="frontend"
LOG="/tmp/${COMPONENT}.log"
APPUSER="roboshop"


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


echo -n "Disabling nodejs default version: "
dnf module disable nodejs -y &>> $LOG
stat $?

echo -n "Enabling nodejs:20 version: "
dnf module enable nodejs:20 -y &>> $LOG
stat $?

echo -n "Installing nodejs package: "
dnf install nodejs -y &>> $LOG
stat $?

id $APPUSER
if [ $? -ne 0 ];then
    echo -n "Creating $APPUSER: "
    useradd $APPUSER
    stat $?
else
    echo -e "\e[33m Skipping \e[0m"
fi    

echo -n "Downloading the $COMPONENT app: "
mkdir /app
curl -o /tmp/${COMPONENT}.zip https://stan-robotshop.s3.amazonaws.com/${COMPONENT}-v3.zip &>> $LOG
stat $?

echo -n "Extracting the $COMPONENT app: "
cd /app
unzip /tmp/${COMPONENT}.zip &>> $LOG
stat $?
