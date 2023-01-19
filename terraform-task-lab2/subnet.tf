resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_sub[count.index]
  count=length(var.cidr_block_sub)
  tags = {
    Name = var.name[count.index]
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main[0].id
  route_table_id = aws_route_table.example.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main[1].id
  route_table_id = aws_route_table.private.id
}