resource "aws_instance" "ec2-private" {
  ami           = var.ami-ec2-private
  instance_type = var.type-ec2-private
  key_name = var.key-private
  associate_public_ip_address = false
  subnet_id = var.subnet-id-for-ec2private
  vpc_security_group_ids= var.sec-gr-private
  user_data = <<EOF
     #!/bin/bash
     # Use this for your user data (script from top to bottom)
     # install httpd (Linux 2 version)
     apt-get update -y
     apt-get install apache2 -y
    EOF

  tags = {
    Name = var.ec2-private-name
  }
} 