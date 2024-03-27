######################################################
##                    VPC Subnet                    ##
######################################################
output "public_subnet_1_id" {
  value = aws_subnet.subnet["public_subnet_1"].id
}

output "public_subnet_2_id" {
  value = aws_subnet.subnet["public_subnet_2"].id
}

output "private_subnet_1_id" {
  value = aws_subnet.subnet["private_subnet_1"].id
}

output "private_subnet_2_id" {
  value = aws_subnet.subnet["private_subnet_2"].id
}