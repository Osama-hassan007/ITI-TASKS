resource "aws_subnet" "proxy1" {
  vpc_id=var.vpc-id-from-mod
  availability_zone = var.availability_zone_proxy1
  cidr_block = var.cidr_block_proxy1
  
  tags = {
    Name = var.name-proxy1
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.proxy1.id
  route_table_id = var.rw-id
}