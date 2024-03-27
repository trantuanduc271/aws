output "id" {
  value = aws_vpc.vpc.id
}

output "gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "default_security_group_id" {
  value = aws_vpc.vpc.default_security_group_id
}