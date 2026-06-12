resource "null_resource" "app" {

    depends_on = [ aws_instance.main, aws_route53_record.private ]

    provisioner "remote-exec" {
        
        connection{
            type= "ssh"
            user= "ec2-user"
            password= "DevOps321"
            host= aws_instance.main.private_ip
        }
        inline = [
            "pip3.11 install ansible",
            "type ansible",
            "ansible-pull -U https://github.com/amlandas2703/B60-DevSecOps.git roboshop-ansible/roboshop-pull.yml -e env=${var.env_name} -e component=${var.name}"
        ]
    }
  
}