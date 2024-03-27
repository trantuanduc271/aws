######################################################
##                Backend & Provider                ##
######################################################
terraform {
  backend "s3" {
    bucket         = "s3-terraform-ductt25-test-as1"
    key            = "tfstate/test"
    region         = "ap-southeast-1"
    dynamodb_table = "test"
  }
}

provider "aws" {
  region = "ap-southeast-1"
  default_tags {
    tags = local.tags
  }
}

######################################################
##                 VPC Routing Table                ##
######################################################
module "aws_route_table" {
  source                   = "./modules/aws_route_table"
  vpc_id                   = module.aws_vpc.id
  public_route_table_name  = local.public_route_table_name
  private_route_table_name = local.private_route_table_name
  gateway_id               = module.aws_vpc.gateway_id
  nat_gateway_id           = module.aws_vpc.nat_gateway_id
}

######################################################
##                    VPC Subnet                    ##
######################################################
module "aws_subnet" {
  source                 = "./modules/aws_subnet"
  vpc_id                 = module.aws_vpc.id
  subnets                = var.subnets
  location               = var.location
  names                  = local.subnet_names
  region                 = var.region
  private_route_table_id = module.aws_route_table.private_route_table_id
  public_route_table_id  = module.aws_route_table.public_route_table_id
}

######################################################
##                        VPC                       ##
######################################################
module "aws_vpc" {
  source                = "./modules/aws_vpc"
  vpc_name              = local.vpc_name
  cidr_block            = var.cidr_block
  internet_gateway_name = local.internet_gateway_name
  eip_name              = local.eip_name
  nat_gateway_name      = local.nat_gateway_name
  nat_gateway_subnet_id = module.aws_subnet.public_subnet_1_id
}