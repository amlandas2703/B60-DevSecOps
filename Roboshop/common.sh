#!/bin/bash


ID=$(id -u)
LOG="/tmp/${COMPONENT}.log"
ENVIRONMENT="$1"
APPUSER="roboshop"


if [ $ID -ne 0 ];then
    echo -e "\e[33m Login as Root user or type sudo command \e[0m"
    exit 1
fi

if [ -z "$1" ];then
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
        exit 2
    fi
}

create_user()
{
    id $APPUSER &>> $LOG
    if [ $? -ne 0 ];then
        echo -n "Creating $APPUSER: "
        useradd $APPUSER 
        stat $?
    else
        echo -e "\e[33m Skipping Appuser creation as already exists \e[0m"
    fi  
    stat $?  
}

download_and_extract()
{
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
}

svc_config()
{
    echo -n "Configuring the service: "
    cp /home/ec2-user/B60-DevSecOps/Roboshop/${COMPONENT}.service /etc/systemd/system/${COMPONENT}.service &>> $LOG
    stat $?

        
    echo -n "Enabling and starting $COMPONENT service: "
    systemctl start $COMPONENT &>> $LOG
    systemctl enable $COMPONENT &>> $LOG
    stat $?
        
}

install_mysql() {
    echo -n "Installing mysql :"
    dnf install mysql -y &>> $LOG
    stat $?
}


install_mongodb_shell()
{
    echo -n "Configuring the mongodb repo: "
    cp /home/ec2-user/B60-DevSecOps/Roboshop/mongo.repo /etc/yum.repos.d/mongo.repo
    stat $?

    echo -n "Installing mongodb: "
    dnf install mongodb-org -y &>> $LOG 
    stat $?
}

maven_install()
{
    echo -n "Installing maven: "
    dnf install maven -y &>> $LOG
    stat $?

    create_user
    download_and_extract

    echo -n "generating $COMPONENT artifacts"
    cd /app &>> $LOG
    mvn clean package &>> $LOG 
    mv target/${COMPONENT}-1.0.jar ${COMPONENT}.jar &>> $LOG
    cd -
    stat $? 

    svc_config
    install_mysql

    if [ "$COMPONENT" == "shipping" ]; then
        echo -n "Injecting the schema :"
        mysql -h mysql.bihamlanet.store -uroot -pRoboShop@1 < /app/db/schema.sql &>> $LOG
        stat $?

        echo -n "Injecting the app-user info: "
        mysql -h mysql.bihamlanet.store -uroot -pRoboShop@1 < /app/db/app-user.sql &>> $LOG
        stat $?

        echo -n "Injecting the master-data info: "
        mysql -h mysql.bihamlanet.store -uroot -pRoboShop@1 < /app/db/master-data.sql &>> $LOG
        stat $?
    fi

    echo -e "\n \t  ******${COMPONENT} component has been configured successfully****** "
}



node_js()
{
    echo -n "Disabling nodejs default version: "
    dnf module disable nodejs -y &>> $LOG
    stat $?

    echo -n "Enabling nodejs:20 version: "
    dnf module enable nodejs:20 -y &>> $LOG
    stat $?

    echo -n "Installing nodejs package: "
    dnf install nodejs -y &>> $LOG
    stat $?

    create_user

    download_and_extract

    svc_config

    echo -n "Generating $COMPONENT-$ENVIRONMENT Artifacts :"
    cd /app
    npm install &>> $LOG
    stat  $?

   
    if [ "$COMPONENT" == "catalogue" ]; then
        echo -n "Injecting the schema :"
        mongosh --host mongodb.bihamlanet.store </app/db/master-data.js &>> $LOG
        stat $? 
    fi 


    echo -e "\n \t  ******${COMPONENT}-${ENVIRONMENT} component has been configured successfully****** "

}


install_python()
{
    echo -n "Installing Python: "
    dnf install python3 gcc python3-devel -y &>> $LOG
    stat $?

    create_user

    download_and_extract

    echo -n "Downloading dependencies: "
    cd /app &>> $LOG
    pip3 install -r requirements.txt &>> $LOG

    svc_config
    
    echo -e "\n \t  ******${COMPONENT} component has been configured successfully****** "

}