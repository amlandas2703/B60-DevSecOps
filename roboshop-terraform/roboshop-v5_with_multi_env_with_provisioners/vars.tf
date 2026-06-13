variable "env_name" {}
variable "ami_name" {}
variable "sg_name" {}
variable "components" {}
variable "domain_name" {}
variable "components" {
  type = map(any)
}

variable "env_name" {
  type = string
}

variable "ami_name" {
  type = string
}
