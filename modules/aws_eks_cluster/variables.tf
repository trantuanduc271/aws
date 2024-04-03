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

#####################################################
#                    EKS Cluster                   ##
#####################################################
variable "eks_cluster_name" {
  type        = string
  description = "(Required) Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores."
}

variable "eks_cluster_version" {
  type        = string
  description = "(Optional) Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. The value must be configured and increased to upgrade the version when desired. Downgrades are not supported by EKS."
}

variable "public_subnet_1_id" {
  type = string
}

variable "public_subnet_2_id" {
  type = string
}
