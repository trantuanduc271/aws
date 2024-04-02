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
##                   EC2 Instance                   ##
######################################################
module "aws_instance" {
  source                        = "./modules/aws_instance"
  iam_instance_profile_name     = local.instance_name
  iam_instance_profile_role     = var.iam_instance_profile_role
  instance_name                 = local.instance_name
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  region                        = var.region
  subnet_id                     = module.aws_subnet.public_subnet_1_id
  user_data                     = var.user_data
  ebs_block_device_volume_size  = var.ebs_block_device_volume_size
  root_block_device_volume_size = var.root_block_device_volume_size
  ami                           = var.ami
}

######################################################
##                    EC2 Key Pair                  ##
######################################################
module "aws_key_pair" {
  source     = "./modules/aws_key_pair"
  key_name   = var.key_name
  public_key = var.public_key
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
##              Default Security Group              ##
######################################################
module "aws_default_security_group" {
  source                      = "./modules/aws_default_security_group"
  default_security_group_name = local.default_security_group_name
  vpc_id                      = module.aws_vpc.id
  ingress_rules               = var.ingress_rules
  egress_rules                = var.egress_rules
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

module "aws_eks_cluster" {
  source = "./modules/aws_eks_cluster"
  public_subnet_1_id = module.aws_subnet.public_subnet_1_id
  public_subnet_2_id = module.aws_subnet.public_subnet_2_id
}