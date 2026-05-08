#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ];then
    echo -e "\e[32m You should run the script as a root \e[0m"
else
    echo -e "\e[33m Welcome to the script \e[0m"
fi