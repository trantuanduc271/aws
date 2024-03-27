######################################################
##                      Project                     ##
######################################################
environment = "test"
location    = "as1"
region      = "ap-southeast-1"
author      = "ductt25"

######################################################
##                    VPC Subnet                    ##
######################################################
subnets = {
  private_subnet_1 = {
    cidr_block = "172.16.0.0/24",
    zone       = "a",
    is_public  = false
  },
  private_subnet_2 = {
    cidr_block = "172.16.1.0/24",
    zone       = "b",
    is_public  = false
  },
  public_subnet_1 = {
    cidr_block = "172.16.2.0/24",
    zone       = "a",
    is_public  = true
  },
  public_subnet_2 = {
    cidr_block = "172.16.3.0/24",
    zone       = "b",
    is_public  = true
  }
}

######################################################
##                        VPC                       ##
######################################################
cidr_block = "172.16.0.0/22"
