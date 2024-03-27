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