#!/bin/bash
COMPONENT="rabbitmq"
source ./common.sh

echo -n "Configuring the repo: "
cp /home/ec2-user/B60-DevSecOps/Roboshop/${COMPONENT}.repo /etc/yum.repos.d/${COMPONENT}.repo &>> $LOG
stat $?

echo -n "Installing $COMPONENT: "
dnf install ${COMPONENT}-server -y &>> $LOG
stat $?

echo -n "Enabling and starting the service: "
systemctl enable ${COMPONENT}-server &>> $LOG 
systemctl start ${COMPONENT}-server &>> $LOG
stat $?

echo -n "Adding $APPUSER: "
rabbitmqctl add_user roboshop roboshop123 &>> $LOG
stat $?

echo -n "Setting user tagse for $APPUSER user: "
rabbitmqctl set_user_tags roboshop administrator &>> $LOG
stat $?

echo -n "Set permission of $APPUSER user: "
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>> $LOG
stat $?

echo -e "\n \t ___ Configuration Management for $COMPONENT in completed! ___"