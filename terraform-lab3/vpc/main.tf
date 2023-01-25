resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_vpc

  tags = {
    Name = "osama-vpc"
  }
}
# --------------------------------------"aws_internet_gateway"-----------------------------
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "osama-gw"
  }
}
# --------------------------------------"aws_route_table"-----------------------------

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

# --------------------------------------"aws_security_group"-----------------------------

resource "aws_security_group" "demo-sg-pub" {
  name = "osama-gr-pub"
  description = "Allow HTTP and SSH traffic via Terraform"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --------------------------------------"aws_nat_gateway"-----------------------------

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_nat_gateway" "saw" {
  allocation_id = aws_eip.example.id
  subnet_id     = var.subnet-id-for-nat
   tags = {
    Name = "osama-natgw"
  }
  depends_on = [
    aws_internet_gateway.gw
  ]
}
# ------------------------------------------------------------------------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_pubrw
    gateway_id = aws_nat_gateway.saw.id
  }

  tags = {
    Name = "osama-rw-private"
  }
}
#--------------------------------------------------------------------------------- 