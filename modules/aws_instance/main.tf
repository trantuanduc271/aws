######################################################
##                   EC2 Instance                   ##
######################################################
resource "aws_instance" "instance" {
  ami                  = var.ami
  availability_zone    = "${var.region}${var.availability_zone}"
  iam_instance_profile = var.iam_instance_profile_name
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = var.subnet_id
  user_data            = file(var.user_data)

  ebs_block_device {
    device_name = var.ebs_block_device_name
    volume_type = var.ebs_block_device_volume_type
    volume_size = var.ebs_block_device_volume_size
    iops        = var.ebs_block_device_iops
    encrypted   = var.ebs_block_device_encrypted
  }

  tags = {
    Name = var.instance_name
  }
}

######################################################
##               IAM Instance Profile               ##
######################################################
resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = var.iam_instance_profile_name
  role = var.iam_instance_profile_role
}