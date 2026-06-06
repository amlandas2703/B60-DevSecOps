resource "aws_instance" "main" {

    for_each      = var.components
    ami           = each.value["ami_id"]
    instance_type = each.value["instance_type"]

    tags = {
      Name = each.key
    }
  
}