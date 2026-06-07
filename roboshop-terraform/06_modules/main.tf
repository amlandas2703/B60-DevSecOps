module "name" {
  source = "./modules"
  instance_type = var.instance_type
  instance_name = var.instance_name
  ami_name = var.ami_name
}

