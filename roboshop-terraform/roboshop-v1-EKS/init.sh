#!/bin/bash
action=$1
env=$2
rm -rf .terraform;
git pull;
terraform init --backend-config=env/"${env}"/state.tfvars; 
# terraform "${action}" --var-file=env/"${env}"/"${env}".tfvars 
terraform "${action}"