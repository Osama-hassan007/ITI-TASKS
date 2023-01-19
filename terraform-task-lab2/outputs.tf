output "public-ip-ec2" {
  value=aws_instance.web.public_ip
}
output "private-ip-ec2" {
  value=aws_instance.web11.private_ip
}