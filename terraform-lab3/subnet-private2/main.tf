resource "aws_subnet" "private-sub2" {
  vpc_id=var.vpc-id-from-mod
  availability_zone = var.availability_zone_subnet_private2
  cidr_block = var.cidr_block_subnet_private2
  
  tags = {
    Name = var.name-subnet_private2
  }
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = var.rw-private2-id
}