resource "aws_instance" "dasa123" {
    ami           = "ami-0fcc78c828f981df2"
    instance_type = "t3.medium"

    tags = {
      Name = "dasa_test_amlan"
    }
}

# output "private_ip_address" {
#     value = aws_instance.dasa_test.private_ip 
# }