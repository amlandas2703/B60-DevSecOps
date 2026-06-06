resource "aws_instance" "main" {

    for_each      = var.components
    ami           = each.value["ami_id"]
    instance_type = lookup(each.value, "instance_type", "t3.medium") 

    tags = {
      Name = each.key
    }
  
}