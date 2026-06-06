resource "aws_instance" "amlan_test" {
    count         = 3
    ami           = "ami-0fcc78c828f981df2"
    instance_type = "t3.medium"

    tags = {
      Name = "amlan_test_${count.index + 1}"
    }
  
}