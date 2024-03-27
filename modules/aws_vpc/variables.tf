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
