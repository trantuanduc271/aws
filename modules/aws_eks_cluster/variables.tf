# ######################################################
# ##                     Project                      ##
# ######################################################
# variable "region" {
#   type        = string
#   description = "The physical location where the project is being provisioned (e.g., us-east-2: ue2, us-east-1: ue1, etc)."
# }

# ######################################################
# ##                   EC2 Instance                   ##
# ######################################################
# variable "ami" {
#   type        = string
#   description = "(Optional) AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template."
# }

# variable "availability_zone" {
#   type        = string
#   description = "(Optional) AZ to start the instance in."
#   default     = "a"
# }

# variable "instance_type" {
#   type        = string
#   description = "(Optional) Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance."
# }

# variable "key_name" {
#   type        = string
#   description = "(Optional) Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
# }

# variable "subnet_id" {
#   type        = string
#   description = "(Optional) VPC Subnet ID to launch in."
# }

# variable "user_data" {
#   type        = string
#   description = "(Optional) User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate."
# }

# variable "instance_name" {
#   type = string
# }

# variable "root_block_device_volume_size" {
#   type        = number
#   description = "(Optional) Size of the volume in gibibytes (GiB)."
# }

# variable "ebs_block_device_name" {
#   type        = string
#   description = "(Required) Name of the device to mount."
#   default     = "/dev/sdh"
# }

# variable "ebs_block_device_volume_type" {
#   type        = string
#   description = "(Optional) Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2."
#   default     = "gp3"
# }

# variable "ebs_block_device_volume_size" {
#   type        = number
#   description = "(Optional) Size of the volume in gibibytes (GiB)."
# }

# variable "ebs_block_device_iops" {
#   type        = number
#   description = "(Optional) Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3."
#   default     = 200
# }

# variable "ebs_block_device_encrypted" {
#   type        = bool
#   description = "(Optional) Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection."
#   default     = true
# }

# ######################################################
# ##               IAM Instance Profile               ##
# ######################################################
# variable "iam_instance_profile_name" {
#   type        = string
#   description = "(Optional, Forces new resource) Name of the instance profile. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix. Can be a string of characters consisting of upper and lowercase alphanumeric characters and these special characters: _, +, =, ,, ., @, -. Spaces are not allowed."
# }

# variable "iam_instance_profile_role" {
#   type        = string
#   description = "(Optional) Name of the role to add to the profile."
# }