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
  name_suffix = "${var.author}-${var.environment}-${var.location}"
  vpc_name    = "vpc-${local.name_suffix}"
}