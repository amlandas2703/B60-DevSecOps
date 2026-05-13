#!/bin/bash

ID=$(id -u)
COMPONENT="redis"
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

start()
{
    echo -n "Starting $COMPONENT service: "
    systemctl enable $COMPONENT &>> $LOG 
    systemctl start $COMPONENT &>> $LOG

}

echo -n "Disabling the default ${COMPONENT}: "
dnf module disable redis -y &>> $LOG
stat $?

echo -n "Enabling the ${COMPONENT}:7 repo: "
dnf module enable redis:7 -y &>> $LOG
stat $?

echo -n "Installing $COMPONENT: "
dnf install $COMPONENT -y &>> $LOG &>> $LOG
stat $?



echo -n "Updating the ${COMPONENT} visibility: "
sed -ie 's/127.0.0.1/0.0.0.0/' /etc/redis/${COMPONENT}.conf &>> $LOG
stat $?

echo -n "Updating the ${COMPONENT} protected mode: "
sed -ie 's/protected-mode yes/protected-mode no/'  /etc/redis/${COMPONENT}.conf &>> $LOG
stat $?



echo -n "Starting ${COMPONENT} service: "
start
stat $?
