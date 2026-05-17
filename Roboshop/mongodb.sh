#!/bin/bash

ID=$(id -u)
COMPONENT="mongodb"
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

start()
{
    echo -n "Starting mongo service: "
    systemctl enable mongod &>> $LOG 
    systemctl start mongod &>> $LOG

}

echo -n "Configuring the ${COMPONENT}-${ENVIRONMENT} repo: "
cp /home/ec2-user/B60-DevSecOps/Roboshop/mongo.repo /etc/yum.repos.d/mongo.repo
stat $?

echo -n "Installing mongodb: "
dnf install mongodb-org -y &>> $LOG 
stat $?


echo -n "Updating the ${COMPONENT}-${ENVIRONMENT} visibility: "
sed -ie 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

echo -n "Starting ${COMPONENT}-${ENVIRONMENT} service: "
start
stat $?

echo -e "\n \t  ******${COMPONENT}-${ENVIRONMENT} component has been configured successfully****** "