resource "aws_instance" "main" {
    
    ami           = data.aws_ami.latest.id
    instance_type = var.instance_type
    

    tags = {
      Name = var.instance_name
    }
  
}