######################################################
##                        VPC                       ##
######################################################
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

######################################################
##               VPC Internet Gateway               ##
######################################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.internet_gateway_name
  }
}

######################################################
##                    Elastic IP                    ##
######################################################
resource "aws_eip" "eip" {
  domain = var.domain
  tags = {
    Name = var.eip_name
  }
}

######################################################
##                  VPC NAT Gateway                 ##
######################################################
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.nat_gateway_subnet_id
  depends_on    = [aws_internet_gateway.internet_gateway]
  tags = {
    Name = var.nat_gateway_name
  }
}

