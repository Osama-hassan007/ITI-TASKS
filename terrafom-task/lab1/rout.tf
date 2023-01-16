
resource "aws_route" "igw-route" {
  route_table_id            = "rtb-075253e1ca8ffd02b"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = "igw-0896d509250f33573"
}