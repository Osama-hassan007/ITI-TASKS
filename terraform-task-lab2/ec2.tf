resource "aws_instance" "web" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.main[0].id
  vpc_security_group_ids= [aws_security_group.demo-sg.id]
  user_data = <<EOF
    #!/bin/bash
    # Use this for your user data (script from top to bottom)
    # install httpd (Linux 2 version)
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello OSAMA from ec2 terraform $(hostname -f)</h1>" > /var/www/html/index.html
    EOF



  tags = {
    Name = "osos-ec2"
  }
}

