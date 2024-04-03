######################################################
##              EKS Data Plane IAM role             ##
######################################################
variable "eks_data_plane_iam_role_name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name. See IAM Identifiers for more information."
  default     = "eks_data_plane"
}

variable "eks_data_plane_policies_arn" {
  type        = list(string)
  description = "(Required) - The ARN of the policy you want to apply."
}

######################################################
##                  EKS Node Group                  ##
######################################################
variable "eks_cluster_name" {
  type        = string
  description = "(Required) Name of the EKS Cluster."
}

variable "public_subnet_1_id" {
  type = string
}

variable "public_subnet_2_id" {
  type = string
}

variable "eks_node_group_desired_size" {
  type        = number
  description = "(Required) Desired number of worker nodes."
}

variable "eks_node_group_max_size" {
  type        = number
  description = "(Required) Maximum number of worker nodes."
}

variable "eks_node_group_min_size" {
  type        = number
  description = "(Required) Minimum number of worker nodes."
}