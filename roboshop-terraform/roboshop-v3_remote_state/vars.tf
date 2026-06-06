variable "components" {
    default = {
            catalogue = {
                ami_id = "ami-0fcc78c828f981df2",
                instance_type = "t3.medium"
            }
            cart = {
                ami_id = "ami-0fcc78c828f981df2",
                instance_type = "t3.micro"
            }
            user = {
                ami_id = "ami-0fcc78c828f981df2",
                instance_type = "t3.micro"
            }
            shipping = {
                ami_id = "ami-0fcc78c828f981df2",
                instance_type = "t3.medium"
            }
            payment = {
                ami_id = "ami-0fcc78c828f981df2",
                instance_type = "t3.micro"
            }
            frontend = {
                #ami_id = "ami-0fcc78c828f981df2",
                #instance_type = "t3.micro"
            }
    }
  
}