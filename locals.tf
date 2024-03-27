######################################################
##                     Project                      ##
######################################################
locals {
  tags = {
    "Managed by"  = "Terraform"
    "Environment" = var.environment
    "Location"    = var.location
    "Author"      = var.author
  }
}

######################################################
##                Naming Convention                 ##
######################################################
locals {
  name_suffix              = "${var.author}-${var.environment}-${var.location}"
  vpc_name                 = "vpc-${local.name_suffix}"
  internet_gateway_name    = "igw-${local.name_suffix}"
  nat_gateway_name         = "nat-${local.name_suffix}"
  eip_name                 = "eip-${local.name_suffix}"
  public_route_table_name  = "rtb-${replace(local.name_suffix, var.author, "public")}"
  private_route_table_name = "rtb-${replace(local.name_suffix, var.author, "private")}"
  subnet_names = {
    for subnet_key, subnet in var.subnets : subnet_key =>
    format("subnet-%s-%s%s", subnet.is_public ? "public" : "private", replace(local.name_suffix, "${var.author}-", ""), subnet.zone)
  }
}