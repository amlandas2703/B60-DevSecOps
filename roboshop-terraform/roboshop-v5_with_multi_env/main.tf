module "ec2" {
  for_each = var.components  
  source = "./modules"
  env_name = var.env_name
  ami_name = var.ami_name
  sg_name = var.sg_name
  name = each.key
  instance_type = each.value["instance_type"]
}

  
}