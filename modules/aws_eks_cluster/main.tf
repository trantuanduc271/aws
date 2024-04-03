######################################################
##            EKS Control Plane IAM role            ##
######################################################
resource "aws_iam_role" "eks_control_plane" {
  name = var.eks_control_plane_iam_role_name

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_control_plane" {
  for_each   = toset(var.eks_control_plane_policies_arn)
  policy_arn = "arn:aws:iam::aws:policy/${each.value}"
  role       = aws_iam_role.eks_control_plane.name
}

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
  for_each   = toset(var.eks_dâta_plane_policies_arn)
  policy_arn = "arn:aws:iam::aws:policy/${each.value}"
  role       = aws_iam_role.eks_data_plane.name
}

# resource "aws_iam_policy" "autoscaler" {
#   name = "ed-eks-autoscaler-policy"
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Action" : [
#           "autoscaling:DescribeAutoScalingGroups",
#           "autoscaling:DescribeAutoScalingInstances",
#           "autoscaling:DescribeTags",
#           "autoscaling:DescribeLaunchConfigurations",
#           "autoscaling:SetDesiredCapacity",
#           "autoscaling:TerminateInstanceInAutoScalingGroup",
#           "ec2:DescribeLaunchTemplateVersions"
#         ],
#         "Effect" : "Allow",
#         "Resource" : "*"
#       }
#     ]
#   })
# }



# resource "aws_iam_role_policy_attachment" "autoscaler" {
#   policy_arn = aws_iam_policy.autoscaler.arn
#   role       = aws_iam_role.worker.name
# }

# resource "aws_iam_instance_profile" "worker" {
#   depends_on = [aws_iam_role.worker]
#   name       = "ed-eks-worker-new-profile"
#   role       = aws_iam_role.worker.name
# }

# ######################################################
# ##                    EKS Cluster                   ##
# ######################################################
# resource "aws_eks_cluster" "eks_cluster" {
#   name     = var.eks_cluster_name
#   role_arn = aws_iam_role.master.arn

#   vpc_config {
#     subnet_ids = [
#       var.public_subnet_1_id,
#       var.public_subnet_2_id
#     ]
#   }

#   tags = {
#     Name = var.eks_cluster_name
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
#     aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
#     aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
#   ]
# }

# resource "aws_eks_node_group" "node-grp" {
#   cluster_name    = aws_eks_cluster.eks.name
#   node_group_name = "pc-node-group"
#   node_role_arn   = aws_iam_role.worker.arn
#   subnet_ids      = [var.public_subnet_1_id, var.public_subnet_2_id]
#   capacity_type   = "ON_DEMAND"
#   disk_size       = 20
#   instance_types  = ["t2.small"]
#   labels = {
#     env = "dev"
#   }
#   scaling_config {
#     desired_size = 2
#     max_size     = 2
#     min_size     = 1
#   }
#   update_config {
#     max_unavailable = 1
#   }
#   depends_on = [
#     aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
#   ]
# }


# ###### Chon verion thap 1.29.0-0