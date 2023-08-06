provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "main" {
  name     = "MyEksCluster"
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = var.subnets
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "MyEksClusterRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

output "kubeconfig" {
  value = aws_eks_cluster.main.kubeconfig
}

output "config_map_aws_auth" {
  value = aws_eks_cluster.main.config_map_aws_auth
}
