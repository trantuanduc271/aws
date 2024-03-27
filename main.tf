######################################################
##                Backend & Provider                ##
######################################################
terraform {
  backend "s3" {
    bucket         = "__bucket__"
    key            = "tfstate/__environment__"
    region         = "__region__"
    dynamodb_table = "__environment__"
  }
}

provider "aws" {
  region = "__region__"
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