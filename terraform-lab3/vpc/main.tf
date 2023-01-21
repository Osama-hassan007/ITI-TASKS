resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_vpc

  tags = {
    Name = "osama-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "osama-gw"
  }
}
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_pubrw
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "osama-rw"
  }
}