######################################################
##                      Project                     ##
######################################################
environment = "test"
location    = "as1"
region      = "ap-southeast-1"
author      = "ductt25"

######################################################
##                   EC2 Instance                   ##
######################################################
ami                          = "ami-0ccb473bada910e74" //AMI Catalog > Community AMIs > amzn2-ami-hvm-2.0.20230808.0-x86_64-gp2
instance_type                = "t3a.small"
iam_instance_profile_role    = "ec2_codebuild"
user_data                    = "./modules/aws_instance/app_user_data.sh"
ebs_block_device_volume_size = 50

######################################################
##                    EC2 Key Pair                  ##
######################################################
key_name   = "ductt25-keypair"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNRVO/vb3gMXy3uJhCeaKGkna09nMchHIL9CUMnS+YTmc+f1Bj0nxdDkKQOElnjPuKuNDRlVSZPxWvu76S+Xe+mS0U0FVBLX2zm0MpXdbkyZiA3LeUxPlLd3P8Gxc9Izmib5Ry9vCR+uuVIwwnjRFDiifGgBMvLb2AYGAVGLPpGfYMS8n3Cf9FKmcxpwexCM+xQkk3YUk90gCtG+xhKSYVoN9Wojq9qngjfQ3W5DTTae7NGF3xQi5WwBpApPKm3Ov9gJsF14HimlhNzAJuuxExWDZ/Y7LttGBcCBeW8jOxHyXQtLpcxz7HYA4/yyXErPcMT2AaHtfasHzJG5anAOxj119SfeNf0oFJ8AfLSNE7F6Kj61J95ecVy5iWdUTx7tGO4D+S7v7d1EOIhL4IjrqC8GQJu4XBPqldkE5+mSuypnVdS/NaUjd2HW2nPsGp8bG/E+Sf55LXKkKxHd2qwI+fKUJKFpGPWpxWG5FX0kCwOmaxjm5iGfal9p2VZ9DOutE= ductt25@DESKTOP-AMGQBUQ"

######################################################
##                    VPC Subnet                    ##
######################################################
subnets = {
  private_subnet_1 = {
    cidr_block = "172.16.0.0/24",
    zone       = "a",
    is_public  = false
  },
  private_subnet_2 = {
    cidr_block = "172.16.1.0/24",
    zone       = "b",
    is_public  = false
  },
  public_subnet_1 = {
    cidr_block = "172.16.2.0/24",
    zone       = "a",
    is_public  = true
  },
  public_subnet_2 = {
    cidr_block = "172.16.3.0/24",
    zone       = "b",
    is_public  = true
  }
}

######################################################
##                        VPC                       ##
######################################################
cidr_block = "172.16.0.0/22"
