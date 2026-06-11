resource "aws_instance" "main" {
    count         = length(var.components)
    ami           = var.ami_id
    instance_type = var.instance_type

    tags = {
      Name = "${var.components[count.index]}"
    }
  

  provisioner "file" {
      source = "provider.tf"
      destination = "/home/ec2-user/provider.tf"


      connection{
          type= "ssh"
          user= "ec2-user"
          password= "DevOps321"
          host= self.private_ip
      }
  }
}

