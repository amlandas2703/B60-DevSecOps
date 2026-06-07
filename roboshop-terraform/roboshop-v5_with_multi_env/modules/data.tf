
data "aws_ami" "latest" {
    most_recent = true
    owners = ["self"]

    filter {
        name   = "name"
        values = ["${var.ami_name}"]
    }
    
}

data "aws_security_group" "sg_name" {
  name= var.sg_name
}

