#!/bin/bash
action=$1
env=$2
rm -rf .terraform;
git pull;
terraform init --backend-config=env/${env}/state.tfvars; 
# terraform "${action}" --var-file=env/"${env}"/"${env}".tfvars 
# terraform "${action}"

if [ "$action" == "plan" ]; then
  terraform plan --var-file=env/${env}/${env}.tfvars
elif [ "$action" == "apply" ]; then
  terraform apply -auto-approve --var-file=env/${env}/${env}.tfvars
elif [ "$action" == "destroy" ]; then
  terraform destroy -auto-approve --var-file=env/${env}/${env}.tfvars  
else
  echo "Invalid action. Please use 'plan' or 'apply'."
fi
