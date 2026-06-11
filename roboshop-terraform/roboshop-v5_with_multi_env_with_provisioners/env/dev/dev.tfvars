components = {

    mongodb = {
        instance_type = "t3.medium"
    }

    catalogue = {
        instance_type = "t3.medium"
    }

     shipping = {
        
        instance_type = "t3.medium"
    }

     payment = {
        
        instance_type = "t3.micro"
    }

     redis = {
        
        instance_type = "t3.micro"
    }

     mysql = {
            
            instance_type = "t3.micro"
    }

     user = {
        
        instance_type = "t3.micro"
    }

     cart = {
        
        instance_type = "t3.micro"
    }
     
     rabbitmq = {
        
        instance_type = "t3.micro"
    }    
     
     frontend = {
        
        instance_type = "t3.micro"
    }
}
env_name="dev"
ami_name="Devops_dasa_image_rhel9"
sg_name="B60-security_group"
domain_name="bihamlanet.store"