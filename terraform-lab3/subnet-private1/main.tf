resource "aws_subnet" "private-sub1" {
  vpc_id=var.vpc-id-from-mod
  availability_zone = var.availability_zone_subnet_private1
  cidr_block = var.cidr_block_subnet_private1
  
  tags = {
    Name = var.name-subnet_private1
  }
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = var.rw-private-id
}