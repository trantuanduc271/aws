######################################################
##                 VPC Routing Table                ##
######################################################
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.private_route_table_name
  }
}

######################################################
##        VPC Routing Table Entries (Routes)        ##
######################################################
resource "aws_route" "public_default_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = var.default_route_destination_cidr_block
  gateway_id             = var.gateway_id
}

resource "aws_route" "private_default_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = var.default_route_destination_cidr_block
  nat_gateway_id         = var.nat_gateway_id
}