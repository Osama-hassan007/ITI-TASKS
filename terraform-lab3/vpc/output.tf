output "vpc-id" {
  value=aws_vpc.main.id
}
output "rout-table-id" {
  value=aws_route_table.example.id
}
output "sec-gr-pub" {
  value=aws_security_group.demo-sg-pub.id
}
output "rout-table-private-id" {
  value=aws_route_table.private.id
}