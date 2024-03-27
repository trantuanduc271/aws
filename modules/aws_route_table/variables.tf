######################################################
##                 VPC Routing Table                ##
######################################################
variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
}

variable "public_route_table_name" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

######################################################
##        VPC Routing Table Entries (Routes)        ##
######################################################
variable "default_route_destination_cidr_block" {
  type        = string
  description = "(Optional) The destination CIDR block."
  default     = "0.0.0.0/0"
}

variable "gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route."
}

variable "nat_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC NAT gateway."
}
