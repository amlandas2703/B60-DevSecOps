#!/bin/bash
action=$1
env=$2
token=$3
rm -rf .terraform;
git pull;
terraform init --backend-config=env/"${env}"/state.tfvars; 
terraform "${action}" --var-file=env/"${env}"/"${env}".tfvars -var vault_token=$token -auto-approve