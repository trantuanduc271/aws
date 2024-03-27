######################################################
##                     Project                      ##
######################################################
variable "environment" {
  type        = string
  description = "The environment in which the project is being provisioned (e.g., prod, stage, dev, uat, qa)."
}

variable "location" {
  type        = string
  description = "The abbreviation of physical location where the project is being provisioned (e.g., us-east-2: ue2, us-east-1: ue1, etc)."
}

variable "region" {
  type        = string
  description = "The physical location where the project is being provisioned (e.g., us-east-2: ue2, us-east-1: ue1, etc)."
}

variable "author" {
  type        = string
  description = "The person responsible for creating and managing the Terraform configuration for the project."
}

######################################################
##                        VPC                       ##
######################################################
variable "cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}
