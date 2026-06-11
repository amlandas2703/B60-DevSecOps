resource "null_resource" "dasa-test" {
    provisioner "local-exec" {
        command = "echo Hello World && touch /tmp/hello.txt"
      
    }
}