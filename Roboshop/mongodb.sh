#!/bin/bash

ID=$(id -u)
COMPONENT="mongodb"
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


echo -n "Configuring the ${COMPONENT} repo: "
cp /home/ec2-user/B60-DevSecOps/Roboshop/mongo.repo /etc/yum.repos.d/mongo.repo
stat $?

echo -n "Installing mongodb: "
dnf install mongodb-org -y &>> $LOG 
stat $?

echo -n "Starting mongo service: "
systemctl enable mongod &>> $LOG 
systemctl start mongod &>> $LOG
stat $?

echo -n "Updating the ${COMPONENT} visibility: "
sed -ie 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?