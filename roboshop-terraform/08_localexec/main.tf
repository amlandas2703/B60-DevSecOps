resource "null_resource" "dasa-test" {
    provisioner "local-exec" {
        command = "echo Hello World and the IP is ${self.private_ip} && touch /tmp/hello.txt"
      
    }
}