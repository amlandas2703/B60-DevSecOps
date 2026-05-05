#!/bin/bash

step()
{
    echo "The number of arguments passed is $#"
    echo " The first arg: $1"
    echo "the second arg: $2"

}

step "$@"
sleep 1
step "$@"