resource "aws_internet_gateway" "os-gw" {
  vpc_id = "vpc-0d15826b258284b25"

  tags = {
    Name = "osos-gw"
  }
}