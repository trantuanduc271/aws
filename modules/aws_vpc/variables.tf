######################################################
##                        VPC                       ##
######################################################
variable "vpc_name" {
  type = string
}

variable "cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}

######################################################
##               VPC Internet Gateway               ##
######################################################
variable "internet_gateway_name" {
  type = string
}

######################################################
##                    Elastic IP                    ##
######################################################
variable "domain" {
  type        = string
  description = "Indicates if this EIP is for use in VPC (vpc)."
  default     = "vpc"
}

variable "eip_name" {
  type = string
}

######################################################
##                  VPC NAT Gateway                 ##
######################################################
variable "nat_gateway_subnet_id" {
  type        = string
  description = "(Required) The Subnet ID of the subnet in which to place the NAT Gateway."
}

variable "nat_gateway_name" {
  type = string
}