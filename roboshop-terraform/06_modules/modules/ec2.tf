resource "aws_instance" "main" {
    
    ami           = "ami-0fcc78c828f981df2"
    instance_type = var.instance_type
    

    tags = {
      Name = "sample"
    }
  
}