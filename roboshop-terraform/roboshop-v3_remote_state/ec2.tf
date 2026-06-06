resource "aws_instance" "main" {
    for_each      = var.components
    ami           = lookup(each.value, "ami_id", "ami-0fcc78c828f981df2")
    instance_type = lookup(each.value, "instance_type", "t3.medium")

    tags = {
      Name = "${var.components[count.index]}"
    }
  
}