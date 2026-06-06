variable "components" {
    default = ["catalogue", "cart", "user", "shipping", "payment", "frontend"]
  
}

variable "ami_id" {
    default = "ami-0fcc78c828f981df2"
  
}

variable "instance_type" {
    default = "t3.medium"
  
}