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

rabbitmqctl list_users | grep roboshop  &>> $LOG
if [ $? -ne 0 ]; then 
    echo -n "Creatng $COMPONENT User"
    rabbitmqctl add_user ${APPUSER} roboshop123
    stat $?

    echo -n "Configuring Permissions: "
    rabbitmqctl set_user_tags ${APPUSER} administrator
    rabbitmqctl set_permissions -p / ${APPUSER} ".*" ".*" ".*"
    stat $?

else 
    echo -e "\e[33m Skipping \e[0m"
fi   

echo -n "Setting user tagse for $APPUSER user: "
rabbitmqctl set_user_tags $APPUSER administrator &>> $LOG
stat $?

echo -n "Set permission of $APPUSER user: "
rabbitmqctl set_permissions -p / $APPUSER ".*" ".*" ".*" &>> $LOG
stat $?

echo -e "\n \t  ******${COMPONENT} component has been configured successfully****** "