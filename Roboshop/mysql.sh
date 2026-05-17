#!/bin/bash
COMPONENT="mysql"
source ./common.sh


echo -n "Install mysql server: "
dnf install mysql-server -y  &>> $LOG
stat $?

echo -n "Start and Enable mysqld: "
systemctl enable mysqld &>> $LOG
systemctl start mysqld &>> $LOG
stat $?


echo -n "Configuring the root password"
mysql_secure_installation --set-root-pass RoboShop@1 &>> $LOG 
stat $?

echo -e "\n \t  ******${COMPONENT} component has been configured successfully****** "
