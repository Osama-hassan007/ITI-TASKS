resource "aws_vpc" "osos-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "osos-vpc"
  }
}