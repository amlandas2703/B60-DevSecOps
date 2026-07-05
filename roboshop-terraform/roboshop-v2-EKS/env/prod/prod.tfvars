components = {

    mongodb = {
        instance_type = "t3.medium"
        internal = true
    }

    catalogue = {
        instance_type = "t3.medium"
        internal = true
    }

     shipping = {
        
        instance_type = "t3.medium"
        internal = true
    }

     payment = {
        
        instance_type = "t3.micro"
        internal = true
    }

     redis = {
        
        instance_type = "t3.micro"
        internal = true
    }

     mysql = {
            
            instance_type = "t3.micro"
            internal = true
    }

     user = {
        
        instance_type = "t3.micro"
        internal = true
    }

     cart = {
        
        instance_type = "t3.micro"
        internal = true
    }
     
     rabbitmq = {
        
        instance_type = "t3.micro"
        internal = true
    }    
     
     frontend = {
        
        instance_type = "t3.micro"
        internal = false
    }
}
env_name="prod"
ami_name="Devops_dasa_image_rhel9"
sg_name="DevOps-B60-sg"
domain_name="bihamlanet.store"