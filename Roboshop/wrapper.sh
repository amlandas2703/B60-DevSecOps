#!/bin/bash

COMPONENT=$1
ENVIRONMEMT=$2

if [ -z "$1" ] && [ -z "$2" ];then
    echo -e "\e[33m Expected Usage \n \t : sudo bash $0 ComponentName EnvironmentName \e[0m"
fi

bash ${1}.sh