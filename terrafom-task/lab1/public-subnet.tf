resource "aws_subnet" "osos-pub" {
  vpc_id     = "vpc-0d15826b258284b25"
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "public-sub"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = "subnet-0b777d07b19e9deb7"
  route_table_id = "rtb-075253e1ca8ffd02b"
}