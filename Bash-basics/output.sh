#!/bin/bash
echo -e "\n hello world \n"
echo "the script name is $0"

var1=$1
var2=$2

echo $var1
echo $var2

echo "Number of arguments used $#"
echo "variable used are $@"