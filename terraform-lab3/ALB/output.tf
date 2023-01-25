output "alp-dns-private" {
  value=aws_lb.for-private.dns_name
}
output "alp-dns-pub" {
  value = aws_lb.for-pub.dns_name
}