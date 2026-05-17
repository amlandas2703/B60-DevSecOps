#!/bin/bash

ID=$(id -u)
COMPONENT="frontend"
ENVIRONMENT="$1"
LOG="/tmp/${COMPONENT}.log"

if [ $ID -ne 0 ];then
    echo -e "\e[33m Login as Root user or type sudo command \e[0m"
    exit 1
fi

if [ -z "$1" ]; then
    echo -e "\e[33m Script has to run as root user + EnvironmentName \e[0m"
    echo -e "\e[33m To give example sudo bash $0 dev \e[0m"
    exit 2
fi  
  
stat()
{
    if [ $1 -eq 0 ];then
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[31m Failure \e[0m"
        exit 3
    fi
} 

echo -e "\n \t  ******${COMPONENT} ${ENVIRONMENT} configuration is in progress****** "

echo -n "Disabling nginx default package version: "
dnf module disable nginx -y &>> $LOG
stat $?

echo -n "Enabling nginx package version: "
dnf module enable nginx:1.24 -y &>> $LOG
stat $?

echo -n "installing nginx package: "
dnf install nginx -y &>> $LOG
stat $?


echo -n "Download the ${COMPONENT} code: "
curl -L -o /tmp/frontend.zip https://stan-robotshop.s3.amazonaws.com/${COMPONENT}-v3.zip &>> $LOG
stat $?

echo -n "Removing the defailt nginx files: "
cd /usr/share/nginx/html
rm -rf *
stat $?

echo -n "Unzipping the ${COMPONENT} component: "
unzip -o /tmp/${COMPONENT}.zip -d /usr/share/nginx/html/ &>> $LOG
stat $?

echo -n "Copying the proxy configuration file: "
cp /home/ec2-user/B60-DevSecOps/Roboshop/nginx.conf /etc/nginx/nginx.conf
sed -i -e "s/env/$ENVIRONMENT/g" /etc/nginx/nginx.conf
stat $?

echo -n "Starting and enabling nginx service: "
systemctl enable nginx &>> $LOG
systemctl restart nginx &>> $LOG
stat $?


echo -e "\n \t  ******${COMPONENT} component has been configured successfully****** "

