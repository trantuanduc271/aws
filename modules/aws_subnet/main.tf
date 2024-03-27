######################################################
##                    VPC Subnet                    ##
######################################################
resource "aws_subnet" "subnet" {
  for_each                = var.subnets
  vpc_id                  = var.vpc_id
  availability_zone       = "${var.region}${each.value.zone}"
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.is_public
  tags = {
    Name = lookup(var.names, each.key)
  }
}

######################################################
##              Route Table Association             ##
######################################################
resource "aws_route_table_association" "subnet_association" {
  for_each       = var.subnets
  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = each.value.is_public ? var.public_route_table_id : var.private_route_table_id
}
