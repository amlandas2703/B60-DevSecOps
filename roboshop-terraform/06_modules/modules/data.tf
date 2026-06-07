data "aws_ami" "latest" {
    most_recent = true
    owners = ["self"]

    filter {
        name   = "name"
        values = ["${var.ami_name}"]
    }
    

  
}