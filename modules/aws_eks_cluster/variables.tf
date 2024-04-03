######################################################
##                     Project                      ##
######################################################
# variable "region" {
#   type        = string
#   description = "The physical location where the project is being provisioned (e.g., us-east-2: ue2, us-east-1: ue1, etc)."
# }

######################################################
##            EKS Control Plane IAM role            ##
######################################################
variable "eks_control_plane_iam_role_name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name. See IAM Identifiers for more information."
  default     = "eks_control_plane"
}

variable "eks_control_plane_policies_arn" {
  type        = list(string)
  description = "(Required) - The ARN of the policy you want to apply."
}

######################################################
##              EKS Data Plane IAM role             ##
######################################################
variable "eks_data_plane_iam_role_name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name. See IAM Identifiers for more information."
  default     = "eks_data_plane"
}

variable "eks_dâta_plane_policies_arn" {
  type        = list(string)
  description = "(Required) - The ARN of the policy you want to apply."
}

######################################################
##                    EKS Cluster                   ##
######################################################
# variable "eks_cluster_name" {
#   type        = string
#   description = "(Required) Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores."
# }


variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}