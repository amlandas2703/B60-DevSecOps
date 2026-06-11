resource "null_resource" "app" {

    depends_on = [ aws_instance.main ]

    provisioner "remote-exec" {
        
        connection{
            type= "ssh"
            user= "ec2-user"
            password= "DevOps321"
            host= aws_instance.main.private_ip
        }
        inline = [
            "pip3.11 install ansible"
             $ ansible-pull -U https://github.com/B60-CloudDevOps/roboshop-ansible.git roboshop/roboshop-pull.yml -e env=dev -e component=mongodb
        ]

    }
  
}