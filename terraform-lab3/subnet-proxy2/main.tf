resource "aws_subnet" "proxy2" {
  vpc_id=var.vpc-id-from-mod
  availability_zone = var.availability_zone_proxy2
  cidr_block = var.cidr_block_proxy2
  
  tags = {
    Name = var.name-proxy2
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.proxy2.id
  route_table_id = var.rw-id
}