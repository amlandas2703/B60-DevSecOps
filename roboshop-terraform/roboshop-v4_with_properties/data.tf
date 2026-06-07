data "aws_security_group" "selected" {
  name= "B60-security_group"
}

output "security_group_id" {
  value = data.aws_security_group.selected.id
  
}