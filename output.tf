######################################################
##                     Project                      ##
######################################################
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

output "aws_iam_principal" {
  value = data.aws_caller_identity.current.arn
}

output "aws_region" {
  value = data.aws_region.current.name
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}
