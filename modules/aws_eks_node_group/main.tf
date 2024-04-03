######################################################
##              EKS Data Plane IAM role             ##
######################################################
resource "aws_iam_role" "eks_data_plane" {
  name = var.eks_data_plane_iam_role_name

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_data_plane" {
  for_each   = toset(var.eks_data_plane_policies_arn)
  policy_arn = "arn:aws:iam::aws:policy/${each.value}"
  role       = aws_iam_role.eks_data_plane.name
}

######################################################
##                  EKS Node Group                  ##
######################################################
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name  = var.eks_cluster_name
  node_role_arn = aws_iam_role.eks_data_plane.arn
  subnet_ids    = [var.public_subnet_1_id, var.public_subnet_2_id]

  scaling_config {
    desired_size = var.eks_node_group_desired_size
    max_size     = var.eks_node_group_max_size
    min_size     = var.eks_node_group_min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_data_plane
  ]

  tags = {
    Name = var.eks_cluster_name
  }
}