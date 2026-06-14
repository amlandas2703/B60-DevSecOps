variable "env_name" {
    type = string
    default = tools
}
variable "ami_name" {
    type = string
    default = "Devops_dasa_image_rhel9"
}
variable "sg_name" {
    type = string
    default = "B60-security_group"  
}

variable "domain_name" {
    type = string
    default = "bihamlanet.store"
}

variable "tools" {
    default = {
        jenkins = {
            instance_type = "t3.medium"
            internal = false
  
}