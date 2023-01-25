resource "aws_instance" "ec2-nginx-1" {
  ami           = var.ami-ec2-proxy1
  instance_type = var.type-ec2-proxy1
  associate_public_ip_address = var.status-pub-ip
  vpc_security_group_ids = var.sec-gr-pub
  subnet_id = var.proxy1-id
  key_name = var.ec2_key_name

  provisioner "remote-exec" {
    inline = var.provisioner-reverse-proxy
  }
   connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = self.public_ip
    private_key = file("./saw-1.pem")

  }

   tags = {
    Name = var.ec2-1-name
  }
   provisioner "local-exec" {
    when = create
   command = var.local-exec-ec2
 }
}
