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
##                        VPC                       ##
######################################################
module "aws_vpc" {
  source     = "./modules/aws_vpc"
  vpc_name   = local.vpc_name
  cidr_block = var.cidr_block
}