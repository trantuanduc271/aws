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
##            EKS Control Plane IAM role            ##
######################################################
variable "eks_control_plane_policies_arn" {
  type        = list(string)
  description = "(Required) - The ARN of the policy you want to apply."
}

######################################################
##                   EC2 Instance                   ##
######################################################
variable "ami" {
  type        = string
  description = "(Optional) AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template."
}

variable "instance_type" {
  type        = string
  description = "(Optional) Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "user_data" {
  type        = string
  description = "(Optional) User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate."
}

variable "root_block_device_volume_size" {
  type        = number
  description = "(Optional) Size of the volume in gibibytes (GiB)."
}

variable "ebs_block_device_volume_size" {
  type        = number
  description = "(Optional) Size of the volume in gibibytes (GiB)."
}

######################################################
##               IAM Instance Profile               ##
######################################################
variable "iam_instance_profile_role" {
  type        = string
  description = "(Optional) Name of the role to add to the profile."
}

######################################################
##                    EC2 Key Pair                  ##
######################################################
variable "key_name" {
  type        = string
  description = "(Optional) The name for the key pair. If neither key_name nor key_name_prefix is provided, Terraform will create a unique key name using the prefix terraform-."
}

variable "public_key" {
  type        = string
  description = "(Required) The public key material."
}

######################################################
##              Default Security Group              ##
######################################################
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
  description = "(Optional) Configuration block. Detailed below."
  default     = []
}

######################################################
##                    VPC Subnet                    ##
######################################################
variable "subnets" {
  type = map(object({
    cidr_block = string
    zone       = string
    is_public  = bool
  }))
  description = "Map of subnets with their properties."
}

######################################################
##                        VPC                       ##
######################################################
variable "cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}
