resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_pubrw
    gateway_id = aws_nat_gateway.example.id
  }

  tags = {
    Name = "osama-rw-private"
  }
}