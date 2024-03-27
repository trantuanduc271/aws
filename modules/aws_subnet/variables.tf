######################################################
##                     Project                      ##
######################################################
variable "location" {
  type        = string
  description = "The abbreviation of physical location where the project is being provisioned (e.g., us-east-2: ue2, us-east-1: ue1, etc)."
}

variable "region" {
  type        = string
  description = "The physical location where the project is being provisioned (e.g., us-east-2: ue2, us-east-1: ue1, etc)."
}

######################################################
##                    VPC Subnet                    ##
######################################################
variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    zone       = string
    is_public  = bool
  }))
  description = "Map of subnets with their properties."
}

variable "names" {
  type        = map(string)
  description = "Names for the subnets based on their keys."
}

######################################################
##              Route Table Association             ##
######################################################
variable "public_route_table_id" {
  description = "(Required) The ID of the public routing table to associate with."
  type        = string
}

variable "private_route_table_id" {
  description = "(Required) The ID of the private routing table to associate with."
  type        = string
}
