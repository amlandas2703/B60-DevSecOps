#!/bin/bash

ID=$(id -u)
COMPONENT="user"
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

id $APPUSER &>> $LOG
if [ $? -ne 0 ];then
    echo -n "Creating $APPUSER: "
    useradd $APPUSER 
    stat $?
else
    echo -e "\e[33m Skipping \e[0m"
fi    

echo -n "Performing cleanup of $COMPONENT app directory if exist: "
rm -rf /app || true 
stat $?

echo -n "Creating the $COMPONENT directory: "
mkdir /app &>> $LOG
stat $?

echo -n "Downloading the $COMPONENT app: " 
curl -o /tmp/${COMPONENT}.zip https://stan-robotshop.s3.amazonaws.com/${COMPONENT}-v3.zip &>> $LOG
stat $?

echo -n "Extracting the $COMPONENT app: "
cd /app
unzip -o /tmp/${COMPONENT}.zip -d /app/  &>> $LOG
stat $?


echo -n "Configuring the service: "
cp /home/ec2-user/B60-DevSecOps/Roboshop/${COMPONENT}.service /etc/systemd/system/${COMPONENT}.service &>> $LOG
stat $?

echo -n "Enabling and starting the service: "
systemctl start $COMPONENT &>> $LOG
systemctl enable $COMPONENT &>> $LOG
stat $?


echo -n "Generating $COMPONENT Artifacts :"
cd /app
npm install &>> $LOG
stat  $?
    

echo -e "\n \t  ******${COMPONENT} component has been configured successfully****** "
