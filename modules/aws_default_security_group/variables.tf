######################################################
##              Default Security Group              ##
######################################################
variable "default_security_group_name" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "(Optional, Forces new resource) VPC ID. Note that changing the vpc_id will not restore any default security group rules that were modified, added, or removed. It will be left in its current state."
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
    self        = optional(bool)
    description = optional(string)
  }))
  description = "(Optional) Configuration block. Detailed below."
  default     = []
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
    self        = optional(bool)
    description = optional(string)
  }))
  description = "(Optional, VPC only) Configuration block. Detailed below."
  default     = []
}