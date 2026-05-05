#!/bin/bash
var1=$1
var2=$2
step ()
{
    echo "Hello everyone"
    echo "The script name is $0"
    echo "The number of arguements used is $@"
}

step
sleep 2
step
sleep 2
step
