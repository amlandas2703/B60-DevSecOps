resource "null_resource" "app" {

    depends_on = [ aws_instance.main, aws_route53_record.public ]

    provisioner "remote-exec" {
        
        connection{
            type= "ssh"
            user= "ec2-user"
            password= "DevOps321"
            host= aws_instance.main.private_ip
        }
        inline = [
               "which python3.11 || sudo yum install -y python3.11",
               "which pip3.11 || sudo yum install -y python3.11-pip",
               "pip3.11 install --user ansible",
               "export PATH=$PATH:~/.local/bin",
               "ansible --version",
               "pip3.11 install hvac",
               "ansible-pull -U https://github.com/amlandas2703/B60-DevSecOps.git roboshop-ansible/roboshop-pull.yml -e env=${var.env_name} -e component=${var.name}"
        ]
    }
  
}